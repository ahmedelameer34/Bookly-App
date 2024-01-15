import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bookly_app/core/errors/failure.dart';

import 'package:flutter_bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/home/domain/repos/home_repositry.dart';

import '../data_source/home_local_data_source.dart';

class HomeRepositryImpl extends HomeRepositry {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositryImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(
      {int pageNum = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeatureBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeatureBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBestSeller(
      {int pageNum = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchBestSeller();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchBestSeller();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchOlsoLike(
      {int pageNum = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchOlsoLike();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchOlsoLike();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
