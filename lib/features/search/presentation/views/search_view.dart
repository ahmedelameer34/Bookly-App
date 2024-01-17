import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bookly_app/core/utils/styles.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/best_seller_widgets/best_seller_books_list_view_loading_indicator.dart';
import 'package:flutter_bookly_app/features/search/data/repos/search_repositry_imp.dart';
import 'package:flutter_bookly_app/features/search/domain/use_cases/best_books_usecase.dart';
import 'package:flutter_bookly_app/features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:flutter_bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';

import 'package:flutter_bookly_app/features/search/presentation/views/widgets/search_textfield_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(SearchUseCase(getIt.get<SearchRepositryImpl>()))
            ..searchBooks(),
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              SearchTextFieldView(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Search Result',
                style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {
                  if (state is SearchResultLoading) {}
                },
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    return SearchResultListView(
                      books: state.books,
                    );
                  } else if (state is SearchFailure) {
                    return Text(state.failure);
                  } else if (state is SearchResultLoading) {
                    return const BestBooksListViewLoadingIndicator();
                  } else {
                    return const Center(
                        child: Text(
                      'Search books by name',
                      style: Styles.textStyle20,
                    ));
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
