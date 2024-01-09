import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/best_seller_cubit/best_seller_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/best_seller_item_view.dart';

import '../../../domain/entities/book_entity.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerSuccess) {
          List<BookEntity> books = state.books;

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return BookListViewItem(image: books[index].image ?? '');
            },
            itemCount: books.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        } else if (state is BestSellerFailure) {
          return Text(state.failure);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
