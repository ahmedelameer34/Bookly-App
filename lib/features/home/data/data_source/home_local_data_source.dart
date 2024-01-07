import 'package:flutter_bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks();
  List<BookEntity> fetchBestSeller();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchBestSeller() {
    var box = Hive.box<BookEntity>(kBestBooksBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchFeatureBooks() {
    var box = Hive.box<BookEntity>(kHomeBooksBox);
    return box.values.toList();
  }
}