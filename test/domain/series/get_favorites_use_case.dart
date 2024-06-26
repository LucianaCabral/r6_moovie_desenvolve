import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import 'package:r6_moovie_app/domain/usecase/series/get_favorites_use_case.dart';

import '../../stubs/utils/class_mocks.dart';
import '../../stubs/utils/class_series_mocks.dart';
import '../../stubs/utils/stubs.dart';

void main() {
  late GetFavoritesSeriesUseCase getFavoritesSeriesUseCase;
  late SeriesRepository seriesRepository;

  final series = seriesMock;

  setUpAll(() {
    seriesRepository = SeriesRepositoryMock();
    getFavoritesSeriesUseCase = GetFavoritesSeriesUseCase(seriesRepository);
  });

  group('getFavoritesUseCaseSerie', () {
    test('should return a list of series', () async {
      when(() => seriesRepository.getFavorites())
          .thenAnswer((_) => Future.value([series]));

      final result = await getFavoritesSeriesUseCase.getFavorites();

      expect(result, [series]);
    });
  });
}
