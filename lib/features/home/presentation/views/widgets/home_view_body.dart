import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/core/utils/styles.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';

import 'books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          BooksListView(),
          SizedBox(height: 50),
          Text(
            'Best Seller',
            style: Styles.textStyle18,
          )
        ],
      ),
    );
  }
}
