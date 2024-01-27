import 'package:flutter/material.dart';
import 'package:client/src/common.dart';

class SquareImage extends StatelessWidget {
  final String? thumbnailFileName;

  const SquareImage(this.thumbnailFileName);

  String? toUrl() {
    return "$httpServerURL/images/$thumbnailFileName";
  }

  @override
  Widget build(BuildContext context) {
    const AssetImage placeholder = AssetImage('assets/images/flutter_logo.png');

    return AspectRatio(
      aspectRatio: 1.0,
      child: Image.network(
        thumbnailFileName != null
            ? toUrl()!
            : '', // Set empty string if thumbnailFileName is null
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
