import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:travel_app/constants/app_theme.dart';
import '../database/db_helper.dart';
import '../models/destination.dart';
import '../screens/detail_screen.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => showSearch(
              context: context,
              delegate: DestinationSearchDelegate(),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.muted, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    'Discover a city',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Filter Button - coming soon!'),
                backgroundColor: AppColors.indigo,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.indigo,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.indigo.withOpacity(0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}

class DestinationSearchDelegate extends SearchDelegate<Destination?> {

  @override
  String get searchFieldLabel => 'Search cities or destinations…';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: AppColors.text),
      onPressed: () => close(context, null),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.close_rounded, color: AppColors.muted, size: 20),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) {
      return _EmptyPrompt();
    }

    return FutureBuilder<List<_SearchResult>>(
      future: _searchAll(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.indigo),
          );
        }

        final results = snapshot.data ?? [];

        if (results.isEmpty) {
          return _NoResults(query: query);
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: results.length,
          separatorBuilder: (_, __) => const Divider(height: 1, indent: 72, endIndent: 15, color: AppColors.muted),
          itemBuilder: (context, index) {
            final result = results[index];
            return _SuggestionTile(
              result: result,
              query: query,
              onTap: () {
                close(context, result.destination);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(destination: result.destination),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => buildSuggestions(context);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.muted, fontSize: 15),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: AppColors.text, fontSize: 15),
      ),
    );
  }

  Future<List<_SearchResult>> _searchAll(String query) async {
    final q = query.toLowerCase().trim();

    final rows = await DatabaseHelper.instance.getAllDestinations();
    final destinations = rows.map((r) => Destination.fromMap(r)).toList();

    final List<_SearchResult> results = [];
    final Set<String> addedIds = {};

    for (final dest in destinations) {
      final matchesName     = dest.name.toLowerCase().contains(q);
      final matchesLocation = dest.location.toLowerCase().contains(q);
      final matchesCountry  = dest.country.toLowerCase().contains(q);

      if (matchesName || matchesLocation || matchesCountry) {
        if (!addedIds.contains(dest.id)) {
          addedIds.add(dest.id);
          String subtitle = dest.country;
          if (matchesLocation && !matchesName) subtitle = dest.location;
          results.add(_SearchResult(
            destination: dest,
            matchType: matchesName ? 'Destination' : 'Location',
            subtitle: subtitle,
          ));
        }
      }
    }

    for (final city in popularCities) {
      if (city.name.toLowerCase().contains(q)) {
        for (final dest in destinations) {
          if (!addedIds.contains(dest.id) &&
              (dest.name.toLowerCase().contains(city.name.toLowerCase()) ||
                  dest.location.toLowerCase().contains(city.name.toLowerCase()) ||
                  dest.country.toLowerCase().contains(city.name.toLowerCase()))) {
            addedIds.add(dest.id);
            results.add(_SearchResult(
              destination: dest,
              matchType: 'City',
              subtitle: dest.country,
            ));
          }
        }
      }
    }
    return results;
  }
}

class _SearchResult {
  final Destination destination;
  final String matchType;
  final String subtitle;

  const _SearchResult({
    required this.destination,
    required this.matchType,
    required this.subtitle,
  });
}

class _SuggestionTile extends StatelessWidget {
  final _SearchResult result;
  final String query;
  final VoidCallback onTap;

  const _SuggestionTile({
    required this.result,
    required this.query,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),

      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: result.destination.imageUrl,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
          placeholder: (_, __) => Container(color: AppColors.indigoPale, width: 48, height: 48),
        ),
      ),

      title: _HighlightedText(
        fullText: result.destination.name,
        query: query,
      ),

      subtitle: Text(
        result.subtitle,
        style: const TextStyle(fontSize: 12, color: AppColors.muted),
      ),

      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.indigoPale,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          result.matchType,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.indigo,
          ),
        ),
      ),
    );
  }
}

class _HighlightedText extends StatelessWidget {
  final String fullText;
  final String query;

  const _HighlightedText({required this.fullText, required this.query});

  @override
  Widget build(BuildContext context) {
    final lowerText  = fullText.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final matchStart = lowerText.indexOf(lowerQuery);

    if (matchStart == -1) {
      return Text(fullText, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.text));
    }
    final matchEnd = matchStart + query.length;

    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.text),
        children: [
          if (matchStart > 0)
            TextSpan(text: fullText.substring(0, matchStart)),
          TextSpan(
            text: fullText.substring(matchStart, matchEnd),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.indigo,
            ),
          ),
          if (matchEnd < fullText.length)
            TextSpan(text: fullText.substring(matchEnd)),
        ],
      ),
    );
  }
}

class _EmptyPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.indigoPale,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.travel_explore_rounded, color: AppColors.indigo, size: 36),
          ),
          const SizedBox(height: 16),
          const Text(
            'Search destinations',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.text),
          ),
          const SizedBox(height: 6),
          const Text(
            'Try "Grand Canyon", "Kyoto", or "Greece"',
            style: TextStyle(fontSize: 13, color: AppColors.muted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _NoResults extends StatelessWidget {
  final String query;
  const _NoResults({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off_rounded, color: AppColors.muted, size: 64),
          const SizedBox(height: 16),
          Text(
            'No results for "$query"',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.text),
          ),
          const SizedBox(height: 6),
          const Text(
            'Try searching for a city or destination name.',
            style: TextStyle(fontSize: 13, color: AppColors.muted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
