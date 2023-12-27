import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/list_view_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ListViewItem();
        },
        itemCount: 50,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
