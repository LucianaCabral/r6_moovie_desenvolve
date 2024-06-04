import '../../entities/series.dart';
import '../../repository/series_repository.dart';

class SaveSeriesUseCase {
  final SeriesRepository seriesRepository;

  SaveSeriesUseCase(this.seriesRepository);

  Future<void> invoke(List<Series> series) async {
    return seriesRepository.saveSeries(series);
  }
}