import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:travel_app/constants/app_theme.dart';
import 'package:travel_app/models/destination.dart';

class CityChip extends StatelessWidget {
  final City city;
  final VoidCallback? onTap;

  const CityChip({super.key, required this.city, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: city.imageUrl,
              width: 76,
              height: 76,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 76,
                height: 76,
                color: AppColors.indigoPale,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            city.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}