import 'package:flutter_bookly_app/constants.dart';
import 'package:flutter_bookly_app/core/utils/api_services.dart';
import 'package:flutter_bookly_app/features/home/data/models/book_models/book_model/book_model.dart';

import '../../../../core/utils/save_books_data.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchBestSeller();
  Future<List<BookEntity>> fetchOlsoLike();
}

class HomeRemoteDataSourceImepl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImepl(this.apiServices);
  @override
  Future<List<BookEntity>> fetchBestSeller({int pageNum = 0}) async {
    var data = await apiServices.get(
        endPoint:
            '?filtering=bestseller&q=programming&startIndex=${pageNum * 40}&maxResults=40');
    List<BookEntity> books = getBookList(data);
    saveBooks(books, kBestBooksBox);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchFeatureBooks({int pageNum = 0}) async {
    var data = await apiServices.get(
        endPoint: '?q=programming&startIndex=${pageNum * 40}&maxResults=40');
    List<BookEntity> books = getBookList(data);
    saveBooks(books, kHomeBooksBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchOlsoLike({int pageNum = 0}) async {
    var data = await apiServices.get(
        endPoint:
            '?filtering=bestseller&q=porgramming&startIndex=${pageNum * 40}&maxResults=40');
    List<BookEntity> books = getBookList(data);
    saveBooks(books, kOlsoLikeBooksBox);
    return books;
  }
}
