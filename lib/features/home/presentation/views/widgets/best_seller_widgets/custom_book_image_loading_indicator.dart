import 'package:flutter/material.dart';

class CustomBestSellerBookImageLoadingIndicator extends StatelessWidget {
  const CustomBestSellerBookImageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.grey[50],
        ),
      ),
    );
  }
}
