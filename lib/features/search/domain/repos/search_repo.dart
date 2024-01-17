import 'package:dartz/dartz.dart';
import 'package:flutter_bookly_app/core/errors/failure.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class SearchRepositry {
  Future<Either<Failure, List<BookEntity>>> search({String qeury = ''});
}
