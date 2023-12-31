import 'package:dartz/dartz.dart';
import 'package:flutter_bookly_app/features/home/domain/repos/home_repositry.dart';

import '../../../../core/baseUseCase/base_usecase.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeatureBooksUseCase extends BaseUseCase<List<BookEntity>, NoParam> {
  final HomeRepositry homeRepositry;

  FetchFeatureBooksUseCase(this.homeRepositry);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
    return homeRepositry.fetchFeatureBooks();
  }
}
