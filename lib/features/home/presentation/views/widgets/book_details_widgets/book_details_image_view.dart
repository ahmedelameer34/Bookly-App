import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImageView extends StatelessWidget {
  const BookImageView({super.key, required this.bookImage});
  final String bookImage;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .25),
      child: AspectRatio(
          aspectRatio: 2.8 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: bookImage,
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}
