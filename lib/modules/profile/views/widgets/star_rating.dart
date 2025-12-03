import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating; // 0–5
  final double size;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    final full = rating.floor();
    final half = (rating - full) >= 0.5;
    final empty = 5 - full - (half ? 1 : 0);

    final List<Widget> stars = [];

    for (var i = 0; i < full; i++) {
      stars.add(Icon(Icons.star, size: size, color: const Color(0xFFFFC107)));
    }
    if (half) {
      stars.add(Icon(Icons.star_half, size: size, color: const Color(0xFFFFC107)));
    }
    for (var i = 0; i < empty; i++) {
      stars.add(Icon(Icons.star_border, size: size, color: const Color(0xFFBDBDBD)));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}