import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddQuizModel extends ChangeNotifier{
 String question = '';
 int num;
 Timestamp createdAt;

 String choicetext1 = '';
 bool isTrue1;
 String choicetext2 = '';
 bool isTrue2;
 String choicetext3 = '';
 bool isTrue3;
 String choicetext4 = '';
 bool isTrue4;


  Future addQuiz(String uid) async{
    if(question.isEmpty){
      throw('問題文を入力してください');
    }
    CollectionReference quizes = FirebaseFirestore.instance.collection(uid);
    await quizes.add({
        'question': question,
        'quiznum': num,
        'createdAt': createdAt,
    });
    notifyListeners();
  }

  Future addAnswer1(String uid) async{
    if(choicetext1.isEmpty){
      throw('選択肢を入力してください');
    }
    CollectionReference answers = FirebaseFirestore.instance.collection(uid + '$num');
    await answers.add({
      'choicetext': choicetext1,
      'ansnum': num,
      'isTrue': isTrue1,
    });
    notifyListeners();
  }
 Future addAnswer2(String uid) async{
   if(choicetext2.isEmpty){
     throw('選択肢を入力してください');
   }
   CollectionReference answers = FirebaseFirestore.instance.collection(uid + '$num');
   await answers.add({
     'choicetext': choicetext2,
     'ansnum': num,
     'isTrue': isTrue2,
   });
   notifyListeners();
 }
 Future addAnswer3(String uid) async{
   if(choicetext3.isEmpty){
     throw('選択肢を入力してください');
   }
   CollectionReference answers = FirebaseFirestore.instance.collection(uid + '$num');
   await answers.add({
     'choicetext': choicetext3,
     'ansnum': num,
     'isTrue': isTrue3,
   });
   notifyListeners();
 }
 Future addAnswer4(String uid) async{
   if(choicetext4.isEmpty){
     throw('選択肢を入力してください');
   }
   CollectionReference answers = FirebaseFirestore.instance.collection(uid + '$num');
   await answers.add({
     'choicetext': choicetext4,
     'ansnum': num,
     'isTrue': isTrue4,
   });
   notifyListeners();
 }
}