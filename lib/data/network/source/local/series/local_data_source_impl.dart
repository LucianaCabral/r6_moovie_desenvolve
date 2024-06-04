import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../domain/entities/series.dart';
import 'local_data_source_series.dart';

class LocalDataSourceSeriesImpl implements LocalDataSourceSeries {
  static const String _favoritesSeriesKey = 'favoritesSeriesKey';
  static const String _seriesKey = 'seriesKey';

  @override
  Future<void> addToFavorites(Series series) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Series> favorites = await getFavorites();
    if (!favorites.any((favoriteSerie) => favoriteSerie.id == series.id)) {
      favorites.add(series);
      String jsonFavorites =
          jsonEncode(favorites.map((series) => series.toJson()).toList());
      await prefs.setString(_favoritesSeriesKey, jsonFavorites);
    }
  }

  @override
  Future<void> removeFromFavorites(Series series) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Series> favorites = await getFavorites();
    favorites.removeWhere((favoriteSerie) => favoriteSerie.id == series.id);
    String jsonFavorites =
        jsonEncode(favorites.map((series) => series.toJson()).toList());
    await prefs.setString(_favoritesSeriesKey, jsonFavorites);
  }

  @override
  Future<bool> isFavorite(int id) async {
    List<Series> favorites = await getFavorites();
    return favorites.any((series) => series.id == series.id);
  }

  @override
  Future<List<Series>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonFavorites = prefs.getString(_favoritesSeriesKey);
    if (jsonFavorites != null) {
      List<dynamic> decoded = jsonDecode(jsonFavorites);
      return decoded.map((json) => Series.fromJson(json)).toList();
    }
    return [];
  }

  @override
  Future<void> saveSeries(List<Series> series) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> seriesJsonList =
          series.map((series) => series.toJson()).toList();
      final String moviesJson = jsonEncode(seriesJsonList);
      await prefs.setString(_seriesKey, moviesJson);
    } catch (e) {
      [];
    }
  }

  @override
  Future<List<Series>> getPopularSeries() async {
    final prefs = await SharedPreferences.getInstance();
    final String? seriesJson = prefs.getString(_seriesKey);
    if (seriesJson != null) {
      try {
        final List<dynamic> seriesList = jsonDecode(seriesJson);
        return seriesList.map((json) => Series.fromJson(json)).toList();
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }
}
