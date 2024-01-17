import 'package:dartz/dartz.dart';
import 'package:flutter_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bookly_app/features/search/domain/repos/search_repo.dart';

import '../../../../core/baseUseCase/base_usecase.dart';
import '../../../../core/errors/failure.dart';

class SearchUseCase extends BaseUseCase<List<BookEntity>, String> {
  final SearchRepositry searchRepositry;

  SearchUseCase(this.searchRepositry);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String param = '']) {
    return searchRepositry.search(qeury: param);
  }
}
