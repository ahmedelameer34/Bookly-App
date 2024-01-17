import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';

import 'package:flutter_bookly_app/features/home/presentation/manger/olso_like_Cubit/olso_like_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/shared_widgets/list_view_item_view.dart';

class OlsoLikeListView extends StatefulWidget {
  const OlsoLikeListView({super.key, required this.books});

  final List<BookEntity> books;
  @override
  State<OlsoLikeListView> createState() => _OlsoLikeListViewState();
}

class _OlsoLikeListViewState extends State<OlsoLikeListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.8 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<OlsoLikeCubit>(context)
            .fetchOlsoLikeBooks(pageNum: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ListViewItem(book: widget.books[index]);
        },
        itemCount: widget.books.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 5,
          );
        },
      ),
    );
  }
}
