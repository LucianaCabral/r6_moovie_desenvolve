import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/data/network/source/local/movies/local_data_source_movies.dart';
import 'package:r6_moovie_app/data/network/source/local/series/local_data_source_series.dart';
import 'package:r6_moovie_app/data/network/source/remote/movies/movie_data_source.dart';
import 'package:r6_moovie_app/data/network/source/remote/series/series_data_source.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

class MockMovieDataSource extends Mock implements MovieDataSource {}

class MockLocalDataSourceMovies extends Mock implements LocalDataSourceMovies {}
