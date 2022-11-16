import 'package:dartz/dartz.dart';
import 'package:number_stack/core/errors/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>?> call(Params? params);
}

class NoParams {}
