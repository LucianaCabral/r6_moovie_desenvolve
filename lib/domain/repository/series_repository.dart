import '../entities/series.dart';

abstract class SeriesRepository {
  Future<List<Series>> getPopularSeries();
  Future<void>saveSeries(List<Series> series);
  Future<List<Series>> getFavorites();

  Future<void> addToFavorites(Series series);

  Future<bool> isFavorite(int id);

  Future<void> removeFromFavorites(Series series);
}



