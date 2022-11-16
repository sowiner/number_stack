import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_stack/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_stack/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_stack/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late NumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNum = 1;
  const tNumberTrivia = NumberTrivia(text: "Test", number: 1);

  test('should get concrete number trivia test', () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNum))
        .thenAnswer((_) async => const Right(tNumberTrivia));
    // act
    final result = await usecase(const Params(number: tNum));
    //assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNum));
  });
}
