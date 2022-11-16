import 'package:number_stack/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required super.text, required super.number});

  factory NumberTriviaModel.fromJson(Map<String, dynamic> jsonMap) {
    return NumberTriviaModel(
        // 顯式轉換 int
        text: jsonMap["text"],
        number: (jsonMap["number"] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {"text": text, "number": number};
  }
}
