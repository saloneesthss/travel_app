import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/database/auth_service.dart';

class FavoritesService {
  static final FavoritesService instance = FavoritesService._internal();
  FavoritesService._internal();

  final Set<String> _favoriteIds = {};
  final List<VoidCallback> _listeners = [];

  String get _key {
    final userId = AuthService.instance.currentUserId;
    return 'favorite_destinations_user_${userId ?? 'guest'}';
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_key) ?? [];

    _favoriteIds
      ..clear()
      ..addAll(saved);
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, _favoriteIds.toList());
  }

  Future<void> addFavorite(String destinationId) async {
    _favoriteIds.add(destinationId);
    await _saveFavorites();
    _notifyListeners();
  }

  Future<void> removeFavorite(String destinationId) async {
    _favoriteIds.remove(destinationId);
    await _saveFavorites();
    _notifyListeners();
  }

  Future<bool> toggleFavorite(String destinationId) async {
    final willBecomeFavorite = !_favoriteIds.contains(destinationId);
    if (willBecomeFavorite) {
      await addFavorite(destinationId);
    } else {
      await removeFavorite(destinationId);
    }
    return willBecomeFavorite;
  }

  bool isFavorite(String destinationId) {
    return _favoriteIds.contains(destinationId);
  }

  List<String> get favoriteIds => _favoriteIds.toList();

  void clear() {
    _favoriteIds.clear();
  }

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }
}