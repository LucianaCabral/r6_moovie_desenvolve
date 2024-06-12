import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';

final moviesMock = Movie(
    adult: true,
    backdropPath: 'godzilla.jpg',
    genreIds: [1, 2],
    id: 1,
    originalLanguage: 'en',
    originalTitle: '',
    overview: '',
    popularity: 2.5,
    posterPath: '',
    releaseDate: '',
    title: 'Godzilla',
    video: true,
    voteAverage: 3.1,
    voteCount: 3);

final seriesMock = Series(
    id: 1,
    name: 'Mad',
    overview: 'lorem ipsum',
    firstAirDate: 'firstAirDate',
    voteAverage: 1.0,
    posterPath: 'posterPath',
    backdropPath: 'backdropPath');

final List<Movie> moviesListMock = [
  Movie(
    adult: false,
    backdropPath: 'kong.jpg',
    genreIds: [2, 3],
    id: 2,
    originalLanguage: 'en',
    originalTitle: 'Kong',
    overview: 'A giant ape faces off against Godzilla.',
    popularity: 5.0,
    posterPath: 'kong.jpg',
    releaseDate: '2021-03-31',
    title: 'Kong: Skull Island',
    video: false,
    voteAverage: 7.0,
    voteCount: 2000,
  ),
];

final List<Series> seriesListMock = [
  Series(
    id: 1,
    name: 'Mad',
    overview: 'lorem ipsum',
    firstAirDate: 'firstAirDate',
    voteAverage: 1.0,
    posterPath: 'posterPath',
    backdropPath: 'backdropPath',
  ),
];

