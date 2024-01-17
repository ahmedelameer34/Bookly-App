import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/best_seller_widgets/custom_book_image_loading_indicator.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/shared_widgets/custom_fading_widget.dart';

class BestBooksListViewLoadingIndicator extends StatelessWidget {
  const BestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBestSellerBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
