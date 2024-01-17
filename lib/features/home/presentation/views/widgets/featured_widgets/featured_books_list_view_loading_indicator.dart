import 'package:flutter/material.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/shared_widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/shared_widgets/custom_fading_widget.dart';

class BooksListViewLoadingIndicator extends StatelessWidget {
  const BooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
