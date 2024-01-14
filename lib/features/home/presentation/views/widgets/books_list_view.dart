import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/featured_cubit/featured_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/featured_cubit/featured_state.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/list_view_item_view.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeaturedState>(
      builder: (context, state) {
        if (state is FeaturedSuccess) {
          List<BookEntity> books = state.books;
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ListViewItem(
                  book: books[index],
                );
              },
              itemCount: books.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          );
        } else if (state is FeaturedFailure) {
          return Text(state.failure);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
