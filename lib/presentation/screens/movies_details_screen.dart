import 'package:flutter/material.dart';
import 'package:r6_moovie_app/data/models/movies_model.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final dynamic item;

  const MovieDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = _getTitle();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Detalhes do item aqui $title',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  String _getTitle() {
    try {
      if (item is MoviesModels) {
        return item.title.toString();
      } else if (item is SeriesModels) {
        return item.name.toString();
      }
    } catch (e) {
      return '';
    }

    return '';
  }
}
