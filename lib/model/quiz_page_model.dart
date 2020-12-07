import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_up_to_you_app/quiz.dart';

class QuizModel extends ChangeNotifier{
  List<Quiz> quizlist = [];
  List<Answer> anslist = [];

  Future getQuizList(String uid) async {
    CollectionReference quizs = FirebaseFirestore.instance.collection(uid);
    final snaphots = await quizs.get();
    final docs = snaphots.docs;
    final quizlist = docs.map((doc) => Quiz(doc)).toList();
    quizlist.sort((b, a) => b.quiznum.compareTo(a.quiznum));
    this.quizlist = quizlist;
    notifyListeners();
  }

  Future getAnsList(int num) async {
    CollectionReference anses = FirebaseFirestore.instance.collection('Answer$num');
    final snaphots = await anses.get();
    final docs = snaphots.docs;
    final anslist = docs.map((doc) => Answer(doc)).toList();
    this.anslist = shuffle(anslist);
    notifyListeners();
  }

  List shuffle(List items) {
    var random = new Random();
    for (var i = items.length - 1; i > 0; i--){
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }
  String getCorrectAnswer() {
    for (int i = 0; i < anslist.length; i++) {
      if (anslist[i].isTrue) {
        return anslist[i].choicetext;
      }
    }
    return null;
  }
}