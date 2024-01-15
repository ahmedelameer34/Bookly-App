import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/web_view.dart';

import '../../../../../core/utils/styles.dart';

class BooksButtonAction extends StatelessWidget {
  const BooksButtonAction(
      {super.key, required this.price, required this.bookLink});
  final String price;
  final String bookLink;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 48,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            child: Text(
              price,
              style: Styles.textStyle18.copyWith(color: Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewScreen(bookLink)));
          },
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 48,
            decoration: const ShapeDecoration(
              color: Color(0xFFEF8262),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x2C755DFF),
                  blurRadius: 12,
                  offset: Offset(0, 12),
                  spreadRadius: 0,
                )
              ],
            ),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Free preview',
                style: Styles.textStyle16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
