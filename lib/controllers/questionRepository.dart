import 'package:chat_gpt3_app/core/services.dart';

class QuestionRepository {


  static Future<dynamic> postQuestion(String question) async {
    var data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": question}
      ]
    };
    final result = await Services.post(data);
    return result;
  }
}
