import 'package:dartz/dartz.dart';

import '../../../../core/baseUseCase/base_usecase.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repos/home_repositry.dart';

class FetchBestBooksUseCase extends BaseUseCase<List<BookEntity>, NoParam> {
  final HomeRepositry homeRepositry;

  FetchBestBooksUseCase(this.homeRepositry);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
    return homeRepositry.fetchBestBooks();
  }
}
