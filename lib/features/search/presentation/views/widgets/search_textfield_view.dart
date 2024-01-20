import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bookly_app/features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class SearchTextFieldView extends StatelessWidget {
  var controller = TextEditingController();

  SearchTextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) async {
        await BlocProvider.of<SearchCubit>(context).searchBooks(query: value);
      },
      controller: controller,
      keyboardType: TextInputType.text,
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
            onPressed: () async {
              await BlocProvider.of<SearchCubit>(context)
                  .searchBooks(query: controller.text);
              controller.clear();
            },
          )),
    );
  }
}
