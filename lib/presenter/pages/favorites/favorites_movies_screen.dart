import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presenter/widgets/comon/favorite_toggle_button.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

import '../../../domain/entities/movie.dart';
import '../../bloc/favorites/favorite_bloc.dart';
import '../../bloc/favorites/favorite_event.dart';
import '../../bloc/favorites/favorite_state.dart';

class FavoritesMoviesScreen extends StatefulWidget {
  const FavoritesMoviesScreen({super.key});

  @override
  _FavoritesMoviesScreenState createState() => _FavoritesMoviesScreenState();
}

class _FavoritesMoviesScreenState extends State<FavoritesMoviesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(GetFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.myMoviesFavorites),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoritesLoadedState) {
            return ListView.builder(
              itemCount:
                  state.favoriteMovies.length + state.favoriteSeries.length,
              itemBuilder: (context, index) {
                if (index < state.favoriteMovies.length) {
                  final movie = state.favoriteMovies[index];
                  return _buildMovieCard(movie);
                } else {
                  return const SizedBox.shrink();
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                height: 150,
                width: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: FavoriteToggleButton(media: movie),
          ),
        ],
      ),
    );
  }
}
