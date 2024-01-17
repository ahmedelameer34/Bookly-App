import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/featured_cubit/featured_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/featured_cubit/featured_state.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/featured_widgets/featured_books_list_view_loading_indicator.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/featured_widgets/books_list_view.dart';

class FeatuedBooksListViewBlocBuilder extends StatefulWidget {
  const FeatuedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeatuedBooksListViewBlocBuilder> createState() =>
      _FeatuedBooksListViewBlocBuilderState();
}

class _FeatuedBooksListViewBlocBuilderState
    extends State<FeatuedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedCubit, FeaturedState>(
      listener: (context, state) {
        if (state is FeaturedSuccess) {
          books.addAll(state.books);
        }

        if (state is FeaturedPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              // buildErrorWidget(state.failure),
              SnackBar(content: Text(state.failure)));
        }
      },
      builder: (context, state) {
        if (state is FeaturedSuccess ||
            state is FeaturedPaginationLoading ||
            state is FeaturedPaginationFailure) {
          return FeaturedListView(
            books: books,
          );
        } else if (state is FeaturedFailure) {
          return Text(state.failure);
        } else {
          return const BooksListViewLoadingIndicator();
        }
      },
    );
  }
}
