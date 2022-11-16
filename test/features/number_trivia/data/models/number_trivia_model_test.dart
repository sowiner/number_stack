import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_stack/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_stack/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_read.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(text: "Test Text", number: 1);
  test('should be a subclass of NumberTrivia entity', () async {
    //assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group("fromJson", () {
    test('should return a valid model when the JSON number is an int',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture("trivia.json"));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, tNumberTriviaModel);
    });

    test('should return a valid model when the JSON number is an double',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture("trivia_double.json"));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, tNumberTriviaModel);
    });

    group("toJson", () {
      test('should return to json', () async {
        // act
        final result = tNumberTriviaModel.toJson();
        //assert
        expect(result, {"text": "Test Text", "number": 1});
      });
    });
  });
}
