import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bookly_app/core/utils/styles.dart';
import 'package:flutter_bookly_app/features/home/data/repos/home_repositry_impl.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/home/domain/usecases/olso_like_usecase.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/olso_like_Cubit/olso_like_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_details_widgets/book_details_image_view.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_details_widgets/books_button_action_view.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_details_widgets/olso_like_list_view_builder.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/shared_widgets/book_rating_view.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/shared_widgets/custom_appbar_book_details_view.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OlsoLikeCubit(FetchOlsoLikeUseCase(getIt.get<HomeRepositryImpl>()))
            ..fetchOlsoLikeBooks(),
      child: Scaffold(
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
                    price: book.price == 0.0
                        ? 'Free'
                        : '${book.price.toString()} ${book.currencyCode ?? ''}',
                    bookLink: book.canonicalVolumeLink ?? ''),
                const SizedBox(
                  height: 20,
                ),
                const Text(''),
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
                const OlsoLikeListViewBlocBuilder()
                //  const OlsoLikeListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
