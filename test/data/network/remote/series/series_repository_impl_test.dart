import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/data/repository/series_repository_impl.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';

import '../../../../stubs/utils/class_series_mocks.dart';
import '../../../../stubs/utils/stubs.dart';

void main() {
  late SeriesRepository seriesRepository;
  late MockSeriesDatasource mockSeriesDatasource;
  late MockLocalDataSourceSeries mockLocalDataSourceSeries;

  final series = seriesMock;
  // final seriesList = seriesListMock;

  setUp(() {
    mockSeriesDatasource = MockSeriesDatasource();
    mockLocalDataSourceSeries = MockLocalDataSourceSeries();
    seriesRepository = SeriesRepositoryImpl(
      mockSeriesDatasource,
      mockLocalDataSourceSeries,
    );
  });

  group('getPopularSeries', () {
    test('saveSeries should call local data source to save series', () async {
      // Arrange

      when(() => mockLocalDataSourceSeries.saveSeries(any()))
          .thenAnswer((_) async {});

      // Act
      await seriesRepository.saveSeries([seriesMock]);

      // Assert
      verify(() => mockLocalDataSourceSeries.saveSeries([seriesMock]))
          .called(1);
    });

    test('addToFavorites should call mockLocalDataSourceSeries.addToFavorites',
        () async {
      // Arrange
      when(() => mockLocalDataSourceSeries.addToFavorites(series)).thenAnswer(
        (_) async => Future.value(),
      );

      // Act
      await seriesRepository.addToFavorites(series);

      // Assert
      verify(() => mockLocalDataSourceSeries.addToFavorites(series)).called(1);
    });

    test('getFavorites should return a list of Series', () async {
      // Arrange
      when(() => mockLocalDataSourceSeries.getFavorites())
          .thenAnswer((_) async => Future.value([series]));

      // Act
      final result = await seriesRepository.getFavorites();

      // Assert
      expect(result, [series]);
    });

    test('isFavorite should return true if the series is in favorites',
        () async {
      // Arrange
      when(() => mockLocalDataSourceSeries.isFavorite(series.id))
          .thenAnswer((_) async => true);

      // Act
      final result = await seriesRepository.isFavorite(series.id);

      // Assert
      expect(result, isTrue);
    });

    test(
        'RemoveFromFavorites should call mockLocalDataSourceSeries.removeFromFavorites',
        () async {
      // Arrange
      when(() => mockLocalDataSourceSeries.removeFromFavorites(series))
          .thenAnswer(
        (_) async => Future.value(),
      );
      // Act
      await seriesRepository.removeFromFavorites(series);

      // Assert
      verify(() => mockLocalDataSourceSeries.removeFromFavorites(series))
          .called(1);
    });
  });
}
