import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/core/utils/styles.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/best_seller_cubit/best_seller_cubit.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/best_seller_widgets/best_seller_list_view_builder.dart';

import 'package:flutter_bookly_app/features/home/presentation/views/widgets/featured_widgets/books_list_view_builder.dart';
import 'package:flutter_bookly_app/features/home/presentation/views/widgets/shared_widgets/custom_appbar_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
        await BlocProvider.of<BestSellerCubit>(context)
            .fetchBestSellerBooks(pageNum: nextPage++);
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        slivers: const [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeatuedBooksListViewBlocBuilder(),
                SizedBox(height: 50),
                Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BestSellerListViewBlocBuilder(),
          )
        ],
      ),
    );
  }
}
