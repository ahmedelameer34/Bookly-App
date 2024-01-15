import 'package:dartz/dartz.dart';

import '../../../../core/baseUseCase/base_usecase.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repos/home_repositry.dart';

class FetchOlsoLikeUseCase extends BaseUseCase<List<BookEntity>, int> {
  final HomeRepositry homeRepositry;

  FetchOlsoLikeUseCase(this.homeRepositry);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) {
    return homeRepositry.fetchOlsoLike(pageNum: param);
  }
}
