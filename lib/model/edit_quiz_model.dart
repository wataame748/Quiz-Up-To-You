import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_up_to_you_app/quiz.dart';
class QuizEditModel extends ChangeNotifier{
  List<Quiz> quizlist = [];
  List<Answer> anslist = [];
  void getQuizRealTime(String uid){
    final snapshots = FirebaseFirestore.instance.collection(uid).snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final quizlist = docs.map((doc) => Quiz(doc)).toList();
      quizlist.sort((a, b) => a.quiznum.compareTo(b.quiznum));
      this.quizlist = quizlist;
      notifyListeners();
    });
  }

  void getAnswerRealTime(String uid, int quiznum){
    final snapshots = FirebaseFirestore.instance.collection(uid + '$quiznum').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final anslist = docs.map((doc) => Answer(doc)).toList();
      anslist.sort((a, b) => a.ansnum.compareTo(b.ansnum));
      this.anslist = anslist;
      notifyListeners();
    });
  }

  Future deleteQuiz(Quiz quiz, String uid) async{
    CollectionReference quizes = FirebaseFirestore.instance.collection(uid);
    await quizes.doc(quiz.documentID).delete();
    notifyListeners();
  }
  Future deleteAnsCollection(String uid, int quiznum) async{
    FirebaseFirestore.instance.collection(uid + '$quiznum').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }
 String question;
  String choicetext = '';
  bool isTrue;

  Future updateQuiz(String uid,Quiz quiz) async{
    CollectionReference quizes = FirebaseFirestore.instance.collection(uid);
    await quizes.doc(quiz.documentID).update({
      'question': question,
    });
    notifyListeners();
  }

  Future updateAnswer(String uid, String docID, int quiznum) async{
    CollectionReference answers = FirebaseFirestore.instance.collection(uid + '$quiznum');
    await answers.doc(docID).update({
      'choicetext': choicetext,
    });
    notifyListeners();
  }
}
