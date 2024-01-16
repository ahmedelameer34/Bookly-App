import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/best_seller_cubit/best_seller_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';

class BestSellerListViewBlocBuilder extends StatefulWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  State<BestSellerListViewBlocBuilder> createState() =>
      _BestSellerListViewBlocBuilderState();
}

class _BestSellerListViewBlocBuilderState
    extends State<BestSellerListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellerCubit, BestSellerState>(
      listener: (context, state) {
        if (state is BestSellerSuccess) {
          books.addAll(state.books);
        }

        if (state is BestSellerPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              // buildErrorWidget(state.failure),
              SnackBar(content: Text(state.failure)));
        }
      },
      builder: (context, state) {
        if (state is BestSellerSuccess ||
            state is BestSellerPaginationLoading ||
            state is BestSellerPaginationFailure) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is BestSellerFailure) {
          return Text(state.failure);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
