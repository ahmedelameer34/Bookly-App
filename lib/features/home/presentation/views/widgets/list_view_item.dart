import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/core/utils/assets.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.8 / 4,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AssetsData.testImage))),
      ),
    );
  }
}
