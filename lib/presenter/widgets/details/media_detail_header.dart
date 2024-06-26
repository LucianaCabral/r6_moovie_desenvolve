import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

import '../../../../domain/entities/movie.dart';
import '../../../../domain/entities/series.dart';
import 'arch_banner_image.dart';

class MediaDetailHeader<T> extends StatelessWidget {
  const MediaDetailHeader({
    super.key,
    required this.media,
    required this.height,
    this.action,
  });

  final T media;
  final double height;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final title =
        media is Movie ? (media as Movie).title : (media as Series).name;
    final backdropPath = media is Movie
        ? (media as Movie).backdropPath
        : (media as Series).backdropPath;

    final posterPath = media is Movie
        ? (media as Movie).posterPath
        : (media as Series).posterPath;   

    var backdropPathItem = "https://image.tmdb.org/t/p/w500$backdropPath";
    var posterPathItem = "https://image.tmdb.org/t/p/w500$posterPath";


    final mediaInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s20,
          ),
        ),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: ArcBannerImage(backdropPathItem, height: 80),
        ),
        Positioned(
          bottom: 0.0,
          left: AppPadding.p16,
          right: AppPadding.p16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: posterPathItem,
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              const SizedBox(width: 40),
              Expanded(child: mediaInformation),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: action ?? Container(),
        ),
      ],
    );
  }
}
