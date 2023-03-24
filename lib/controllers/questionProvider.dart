import 'dart:developer';

import 'package:chat_gpt3_app/controllers/questionRepository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionProvider = ChangeNotifierProvider<QuestionProvider>((ref) {
  return QuestionProvider();
});

class QuestionProvider extends ChangeNotifier {
  bool isTyping = false;
  // msg
  //chatIndex me 0 bot 1
  var chatMessages = [];

  postQuestion(String question) async {
    log("start post question");
    isTyping = true;
    notifyListeners();
    final response = await QuestionRepository.postQuestion(question);
    log("question provider response : " + response.toString());
    if (response is String) {
      log(response.toString());
      isTyping = false;
      notifyListeners();
      return;
    } else {
      isTyping = false;
      String answer = response.data['choices'][0]['message']['content'];
      chatMessages.add({
        "chatIndex": 1,
        "msg": answer,
      });
      notifyListeners();
      return;
    }
  }
}