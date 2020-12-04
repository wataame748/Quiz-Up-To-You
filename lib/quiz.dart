import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz{
  Quiz(DocumentSnapshot doc){
    this.quiznum = doc.data()['quiznum'];
    this.question = doc.data()['question'];
    this.createdAt = doc.data()['createdAt'];

}
  int quiznum;
  String question;
  Timestamp createdAt;

}

class Answer{
  Answer(DocumentSnapshot doc){
    this.choicetext = doc.data()['choicetext'];
    this.isTrue = doc.data()['isTrue'];
    this.ansnum = doc.data()['ansnum'];
  }
  String choicetext;
  bool isTrue;
  int ansnum;

  String getCorrectAns(Answer answer){
    if(answer.isTrue){
      return this.choicetext;
    }else{
      return null;
    }
  }
}