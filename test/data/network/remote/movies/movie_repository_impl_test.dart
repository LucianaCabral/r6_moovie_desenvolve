import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/data/repository/movie_repository_impl.dart';

import '../../../../stubs/utils/class_mocks.dart';
import '../../../../stubs/utils/stubs.dart';

void main() {
  late MoviesRepositoryImpl moviesRepository;
  late MockMovieDataSource mockMovieDataSource;
  late MockLocalDataSourceMovies mockLocalDataSourceMovies;

  final movies = moviesMock;

  setUp(() {
    mockMovieDataSource = MockMovieDataSource();
    mockLocalDataSourceMovies = MockLocalDataSourceMovies();
    moviesRepository = MoviesRepositoryImpl(
      mockMovieDataSource,
      mockLocalDataSourceMovies,
    );
  });

  group('getPopularMovies', () {
    test('getPopularMovies should return movies from local data source when available', () async {
      // Arrange
      final movies = moviesListMock;

      when(() => mockLocalDataSourceMovies.getPopularMovies())
          .thenAnswer((_) async => movies);

      // Act
      final result = await moviesRepository.getPopularMovies();

      // Assert
      expect(result, equals(movies));
    });

    test('getPopularMovies should call saveMovies with remote movies when local movies are empty', () async {
      // Arrange
      final movies = moviesListMock;
      when(() => mockLocalDataSourceMovies.getPopularMovies())
          .thenAnswer((_) async => []);
      when(() => mockMovieDataSource.getPopularMovies())
          .thenAnswer((_) async => movies);
      when(() => mockLocalDataSourceMovies.saveMovies(movies))
          .thenAnswer((_) async {});

      // Act
      final result = await moviesRepository.getPopularMovies();

      // Assert
      verify(() => mockLocalDataSourceMovies.saveMovies(movies)).called(1);
      expect(result, equals(movies));
    });

    test('saveMovies should call local data source to save movies', () async {
      // Arrange
      final movies = moviesListMock;
      when(() => mockLocalDataSourceMovies.saveMovies(any()))
          .thenAnswer((_) async {});

      // Act
      await moviesRepository.saveMovies(movies);

      // Assert
      verify(() => mockLocalDataSourceMovies.saveMovies(movies)).called(1);
    });

    test('getPopularMovies should return a list of movies', () async {
      // Arrange
      when(() => mockLocalDataSourceMovies.getPopularMovies())
          .thenAnswer((_) async => moviesListMock);

      when(() => mockMovieDataSource.getPopularMovies())
          .thenAnswer((_) => Future.value(moviesListMock));

      // act
      final result = await moviesRepository.getPopularMovies();

      // Assert
      expect(result, equals(moviesListMock));
    });

    test('getFavorites should return a list of movies', () async {
      // Arrange
      when(() => mockLocalDataSourceMovies.getFavorites())
          .thenAnswer((_) async => Future.value(moviesListMock));

      // Act
      final result = await moviesRepository.getFavorites();

      // Assert
      expect(result, moviesListMock);
    });

    test('addToFavorites should add a movie to favorites', () async {
      // Arrange
      when(() => mockLocalDataSourceMovies.addToFavorites(moviesMock))
          .thenAnswer(
        (_) async => Future.value(),
      );

      // Act
      await moviesRepository.addToFavorites(moviesMock);

      // Assert
      verify(() => mockLocalDataSourceMovies.addToFavorites(moviesMock))
          .called(1);
    });

    test('isFavorite should return true if the movie is in favorites', () async {
      // Arrange
      when(() => mockLocalDataSourceMovies.isFavorite(1))
          .thenAnswer((_) async => Future.value(true));

      // Act
      final result = await moviesRepository.isFavorite(1);

      // Assert
      expect(result, true);
    });

    test('removeFromFavorites should remove a movie from favorites', () async {
      // Arrange
      when(() => mockLocalDataSourceMovies.removeFromFavorites(moviesMock))
          .thenAnswer(
        (_) async => Future.value(),
      );

      // Act
      await moviesRepository.removeFromFavorites(moviesMock);

      // Assert
      verify(() => mockLocalDataSourceMovies.removeFromFavorites(moviesMock))
          .called(1);
    });
  });
}
