import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, required this.rating, required this.ratingCount});
  final String rating;
  final String ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 18,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          rating,
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          ratingCount,
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
