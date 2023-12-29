import 'package:flutter/material.dart';

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                size: 24,
              )),
          const Spacer(),
          IconButton(
              onPressed: () {},
              iconSize: 24,
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
    );
  }
}
