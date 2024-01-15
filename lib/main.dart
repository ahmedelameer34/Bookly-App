import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bookly_app/constants.dart';
import 'package:flutter_bookly_app/core/utils/app_router.dart';
import 'package:flutter_bookly_app/features/home/data/repos/home_repositry_impl.dart';
import 'package:flutter_bookly_app/features/home/domain/usecases/feature_books_usecase.dart';
import 'package:flutter_bookly_app/features/home/domain/usecases/olso_like_usecase.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/best_seller_cubit/best_seller_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/featured_cubit/featured_cubit.dart';
import 'package:flutter_bookly_app/features/home/presentation/manger/olso_like_Cubit/olso_like_cubit.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/adapters.dart';

import 'core/utils/service_locator.dart';
import 'features/home/domain/entities/book_entity.dart';
import 'features/home/domain/usecases/best_books_usecase.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kHomeBooksBox);
  await Hive.openBox<BookEntity>(kBestBooksBox);
  await Hive.openBox<BookEntity>(kOlsoLikeBooksBox);
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedCubit(
              FetchFeatureBooksUseCase(getIt.get<HomeRepositryImpl>()))
            ..fetchFeaturedBooks();
        }),
        BlocProvider(create: (context) {
          return BestSellerCubit(
              FetchBestSellerUseCase(getIt.get<HomeRepositryImpl>()))
            ..fetchBestSellerBooks();
        }),
        BlocProvider(create: (context) {
          return OlsoLikeCubit(
              FetchOlsoLikeUseCase(getIt.get<HomeRepositryImpl>()))
            ..fetchOlsoLikeBooks();
        })
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
