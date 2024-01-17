import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bookly_app/core/errors/failure.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/search/data/data_source/remote_data_source.dart';
import 'package:flutter_bookly_app/features/search/domain/repos/search_repo.dart';

class SearchRepositryImpl extends SearchRepositry {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositryImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> search({String qeury = ''}) async {
    try {
      List<BookEntity> books;

      books = await searchRemoteDataSource.searchBooks(query: qeury);
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
