import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/book_details_image_view.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/custom_appbar_book_details_view.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [CustomAppBarBookDetails(), BookImageView()],
        ),
      ),
    );
  }
}
