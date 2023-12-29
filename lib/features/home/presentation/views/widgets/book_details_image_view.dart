import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class BookImageView extends StatelessWidget {
  const BookImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.40,
        child: AspectRatio(
          aspectRatio: 3.2 / 4,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(AssetsData.testImage))),
          ),
        ),
      ),
    );
  }
}
