import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ArcBannerImage extends StatelessWidget {
  final String imageUrl;

  const ArcBannerImage(this.imageUrl, {super.key, required double height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: MediaQuery.of(context).size.width,
      height: 230.0,
      fit: BoxFit.cover,
      errorWidget: (context, error, stackTrace) {
      return const Text('Falha ao carregar a imagem');
    },
    );
  }
}