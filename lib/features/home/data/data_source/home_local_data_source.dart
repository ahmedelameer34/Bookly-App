import 'package:flutter_bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks();
  List<BookEntity> fetchBestSeller();
  List<BookEntity> fetchOlsoLike();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchBestSeller({int pageNum = 0}) {
    int startIndex = pageNum * 40;
    int endIndex = (pageNum + 1) * 40;
    var box = Hive.box<BookEntity>(kBestBooksBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchFeatureBooks({int pageNum = 0}) {
    int startIndex = pageNum * 40;
    int endIndex = (pageNum + 1) * 40;
    var box = Hive.box<BookEntity>(kHomeBooksBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchOlsoLike({int pageNum = 0}) {
    int startIndex = pageNum * 40;
    int endIndex = (pageNum + 1) * 40;
    var box = Hive.box<BookEntity>(kOlsoLikeBooksBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
