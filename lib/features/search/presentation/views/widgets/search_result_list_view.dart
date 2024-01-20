import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/best_seller_widgets/best_seller_item_view.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return BookListViewItem(
          book: books[index],
        );
      },
      itemCount: books.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
