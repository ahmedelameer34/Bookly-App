import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/best_seller_item_view.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return const BookListViewItem();
      },
      itemCount: 50,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
