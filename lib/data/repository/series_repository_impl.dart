import '../../domain/entities/series.dart';
import '../../domain/repository/series_repository.dart';
import '../network/source/local/series/local_data_source_series.dart';
import '../network/source/remote/series/series_data_source.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesDatasource seriesDatasource;
  final LocalDataSourceSeries localDataSourceSeries;

  SeriesRepositoryImpl(this.seriesDatasource, this.localDataSourceSeries);
  @override
  Future<List<Series>> getPopularSeries() async {
    try {
      final series = await localDataSourceSeries.getFavorites();
      if (series.isEmpty) {
        final remoteSeries = await seriesDatasource.getPopularMSeries();
        await saveSeries(remoteSeries);
        return remoteSeries;
      } else {
        return series;
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> addToFavorites(Series series) async {
  await localDataSourceSeries.addToFavorites(series);
  }

  @override
  Future<List<Series>> getFavorites() async {
   return await localDataSourceSeries.getFavorites();
  }

  @override
  Future<bool> isFavorite(int id) async {
    return await localDataSourceSeries.isFavorite(id);
  }

  @override
  Future<void> removeFromFavorites(Series series) async {
    localDataSourceSeries.removeFromFavorites(series);
  }

  @override
  Future<void> saveSeries(List<Series> series) async {
    await localDataSourceSeries.saveSeries(series);
  }
}
