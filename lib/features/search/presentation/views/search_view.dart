import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/core/utils/styles.dart';

import 'package:flutter_bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter_bookly_app/features/search/presentation/views/widgets/search_textfield_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            SearchTextFieldView(),
            SizedBox(
              height: 15,
            ),
            Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 10,
            ),
            SearchResultListView()
          ],
        ),
      ),
    ));
  }
}
