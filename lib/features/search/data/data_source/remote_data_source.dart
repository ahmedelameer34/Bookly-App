import 'package:flutter_bookly_app/core/utils/api_services.dart';
import 'package:flutter_bookly_app/features/home/data/models/book_models/book_model/book_model.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchBooks({String query = ''});
}

class SearchRemoteDataSourceImp extends SearchRemoteDataSource {
  final ApiServices apiServices;

  SearchRemoteDataSourceImp({required this.apiServices});

  @override
  Future<List<BookEntity>> searchBooks({String query = ''}) async {
    var data = await apiServices.get(endPoint: '?&q=$query&maxResults=40');
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
}
