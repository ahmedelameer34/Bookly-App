import 'package:dartz/dartz.dart';

import '../../../../core/baseUseCase/base_usecase.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repos/home_repositry.dart';

class FetchBestSellerUseCase extends BaseUseCase<List<BookEntity>, int> {
  final HomeRepositry homeRepositry;

  FetchBestSellerUseCase(this.homeRepositry);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) {
    return homeRepositry.fetchBestSeller(pageNum: param);
  }
}
