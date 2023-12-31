import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class BaseUseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
