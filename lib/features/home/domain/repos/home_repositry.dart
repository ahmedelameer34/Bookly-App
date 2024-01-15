import 'package:dartz/dartz.dart';
import 'package:flutter_bookly_app/core/errors/failure.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRepositry {
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(
      {int pageNum = 0});
  Future<Either<Failure, List<BookEntity>>> fetchBestSeller({int pageNum = 0});
  Future<Either<Failure, List<BookEntity>>> fetchOlsoLike({int pageNum = 0});
}
