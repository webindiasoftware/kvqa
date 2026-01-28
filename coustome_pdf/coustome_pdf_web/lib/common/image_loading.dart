import 'package:flutter/material.dart';

///partha paul
///image_loading
///14/12/25

Widget setHomePageImage(String imageUrl, double size, Color colour) {
  return Image.network(
    imageUrl,
    width: size,
    height: size,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return const Center(child: CircularProgressIndicator());
    },
    errorBuilder: (context, error, stackTrace) {
      return Icon(Icons.broken_image, size: size, color: colour);
    },
  );
}
