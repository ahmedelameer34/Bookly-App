import 'package:flutter/material.dart';

import 'list_view_item_view.dart';

class OlsoLikeListView extends StatelessWidget {
  const OlsoLikeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ListViewItem(
            image: '',
          );
        },
        itemCount: 50,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 5,
          );
        },
      ),
    );
  }
}
