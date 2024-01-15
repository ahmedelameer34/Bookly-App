import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';

import 'package:flutter_bookly_app/features/home/presentation/manger/olso_like_Cubit/olso_like_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/list_view_item_view.dart';

class OlsoLikeListView extends StatelessWidget {
  const OlsoLikeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OlsoLikeCubit, OlsoLikeState>(builder: (context, state) {
      if (state is OlsoLikeSuccess) {
        List<BookEntity> books = state.books;
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ListViewItem(book: books[index]);
            },
            itemCount: books.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 5,
              );
            },
          ),
        );
      } else if (state is OlsoLikeFailure) {
        return Text(state.failure);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
