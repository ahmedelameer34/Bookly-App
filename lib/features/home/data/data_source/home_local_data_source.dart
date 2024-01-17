import 'package:flutter_bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks({int pageNum = 0});
  List<BookEntity> fetchBestSeller({int pageNum = 0});
  List<BookEntity> fetchOlsoLike({int pageNum = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchBestSeller({int pageNum = 0}) {
    int startIndex = pageNum * 10;
    int endIndex = (pageNum + 1) * 10;
    var box = Hive.box<BookEntity>(kBestBooksBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchFeatureBooks({int pageNum = 0}) {
    int startIndex = pageNum * 10;
    int endIndex = (pageNum + 1) * 10;
    var box = Hive.box<BookEntity>(kHomeBooksBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchOlsoLike({int pageNum = 0}) {
    int startIndex = pageNum * 10;
    int endIndex = (pageNum + 1) * 10;
    var box = Hive.box<BookEntity>(kOlsoLikeBooksBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
