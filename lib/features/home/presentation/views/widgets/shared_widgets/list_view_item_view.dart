import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_details_widgets/book_details_view.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    required this.book,
    super.key,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailsView(
                      book: book,
                    )));
      },
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: book.image!,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
