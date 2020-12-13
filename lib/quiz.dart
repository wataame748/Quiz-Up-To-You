import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz{
  Quiz(DocumentSnapshot doc){
    this.documentID = doc.id;
    this.quiznum = doc.data()['quiznum'];
    this.question = doc.data()['question'];
    this.createdAt = doc.data()['createdAt'];

}
  int quiznum;
  String question;
  Timestamp createdAt;
  String documentID;
 String getQuizNumText(int quiznum){
   return '$quiznum';
 }
}

class Answer{
  Answer(DocumentSnapshot doc){
    this.documentID = doc.id;
    this.choicetext = doc.data()['choicetext'];
    this.isTrue = doc.data()['isTrue'];
    this.ansnum = doc.data()['ansnum'];
  }
  String choicetext;
  bool isTrue;
  int ansnum;
  String documentID;
}