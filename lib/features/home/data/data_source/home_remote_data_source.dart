import 'package:flutter_bookly_app/core/utils/api_services.dart';
import 'package:flutter_bookly_app/features/home/data/models/book_models/book_model/book_model.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchBestBooks();
}

class HomeRemoteDataSourceImepl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImepl(this.apiServices);
  @override
  Future<List<BookEntity>> fetchBestBooks() async {
    var data = await apiServices.get(endPoint: '?q=porgramming');
    List<BookEntity> books = getBookList(data);
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
  Future<List<BookEntity>> fetchFeatureBooks() async {
    var data =
        await apiServices.get(endPoint: '?filtering=bestseller&q=porgramming');
    List<BookEntity> books = getBookList(data);
    return books;
  }
}
