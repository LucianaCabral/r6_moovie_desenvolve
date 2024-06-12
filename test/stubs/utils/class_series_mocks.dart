import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/data/network/source/local/series/local_data_source_series.dart';
import 'package:r6_moovie_app/data/network/source/remote/series/series_data_source.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';

class MockSeriesDatasource extends Mock implements SeriesDatasource {}
class MockLocalDataSourceSeries extends Mock implements LocalDataSourceSeries {}
class SeriesRepositoryMock extends Mock implements SeriesRepository {}
