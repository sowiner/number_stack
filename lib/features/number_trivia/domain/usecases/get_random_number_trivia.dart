import 'package:dartz/dartz.dart';
import 'package:number_stack/core/errors/failures.dart';
import 'package:number_stack/core/usecases/usecase.dart';
import 'package:number_stack/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_stack/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>?> call(NoParams? _) async =>
      await repository.getRandomNumberTrivia();
}
