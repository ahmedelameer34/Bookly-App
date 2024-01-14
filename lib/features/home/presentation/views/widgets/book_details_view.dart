import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/core/utils/styles.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_details_image_view.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_rating_view.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/custom_appbar_book_details_view.dart';

import 'Books_button_action_view.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBarBookDetails(),
              BookImageView(
                bookImage: book.image!,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                book.title,
                style: Styles.textStyle30,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book.autherName ?? '',
                style: Styles.textStyle18.copyWith(color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              BookRating(
                rating: book.rating.toString(),
                ratingCount: book.ratingCount.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              BooksButtonAction(
                price: book.price.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'You can also like',
                    style: Styles.textStyle16,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // const OlsoLikeListView()
              //  const OlsoLikeListView(),
            ],
          ),
        ),
      ),
    );
  }
}
