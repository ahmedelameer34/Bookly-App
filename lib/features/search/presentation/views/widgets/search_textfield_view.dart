import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextFieldView extends StatelessWidget {
  const SearchTextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(16)),
          hintText: 'Search',
          suffixIcon: IconButton(
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
            onPressed: () {},
          )),
    );
  }
}
