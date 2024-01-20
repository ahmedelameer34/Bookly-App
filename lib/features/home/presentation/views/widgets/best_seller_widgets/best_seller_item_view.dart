import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/core/utils/styles.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_details_widgets/book_details_view.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/shared_widgets/book_rating_view.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.book,
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
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.6 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: book.image!,
                    fit: BoxFit.fill,
                  ),
                )),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Styles.textStyle20,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.autherName ?? '',
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        book.price == 0.0
                            ? 'Free'
                            : '${book.price.toString()} ${book.currencyCode}',
                        style: Styles.textStyle20,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      BookRating(
                        rating: book.rating.toString(),
                        ratingCount: book.ratingCount.toString(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
