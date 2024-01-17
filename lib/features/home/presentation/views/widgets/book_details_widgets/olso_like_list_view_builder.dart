import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';

import 'package:flutter_bookly_app/features/home/presentation/manger/olso_like_Cubit/olso_like_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_details_widgets/olso_like_list_view.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/featured_widgets/featured_books_list_view_loading_indicator.dart';

class OlsoLikeListViewBlocBuilder extends StatefulWidget {
  const OlsoLikeListViewBlocBuilder({
    super.key,
  });

  @override
  State<OlsoLikeListViewBlocBuilder> createState() =>
      _OlsoLikeListViewBlocBuilderState();
}

class _OlsoLikeListViewBlocBuilderState
    extends State<OlsoLikeListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OlsoLikeCubit, OlsoLikeState>(
      listener: (context, state) {
        if (state is OlsoLikeSuccess) {
          books.addAll(state.books);
        }

        if (state is OlsoLikePaginationFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.failure)));
        }
      },
      builder: (context, state) {
        if (state is OlsoLikeSuccess ||
            state is OlsoLikePaginationLoading ||
            state is OlsoLikePaginationFailure) {
          return OlsoLikeListView(
            books: books,
          );
        } else if (state is OlsoLikeFailure) {
          return Text(state.failure);
        } else {
          return const BooksListViewLoadingIndicator();
        }
      },
    );
  }
}
