import 'package:flutter/material.dart';
import 'package:client/src/common.dart';

class SquareImage extends StatelessWidget {
  const SquareImage.fromSongId({super.key, required num? songId})
      : networkImageURL =
            songId == null ? "" : "$httpServerURL/images/song/$songId";
  const SquareImage.fromFromFileName({super.key, required String? fileName})
      : networkImageURL =
            fileName == null ? "" : "$httpServerURL/images/file/$fileName";

  final String networkImageURL;

  @override
  Widget build(BuildContext context) {
    const AssetImage placeholder = AssetImage('assets/images/flutter_logo.png');

    return AspectRatio(
      aspectRatio: 1.0,
      child: Image.network(
        networkImageURL,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return const Image(
            image: placeholder,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
