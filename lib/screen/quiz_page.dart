import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/model/quiz_page_model.dart';
import 'package:quiz_up_to_you_app/quiz.dart';

import 'package:quiz_up_to_you_app/screen/result_page.dart';

class QuizPage extends StatelessWidget{
  QuizPage({
    this.num,
    this.uid,
    this.cansolve,
});
  final uid;

  int num;
  int cansolve;
  @override
  Widget build(BuildContext context) {
    final questionnum = num + 1;
    return ChangeNotifierProvider<QuizModel>(
      create: (_) => QuizModel()..getQuizList(uid)..getAnsList(questionnum, uid),
      child: Scaffold(
            appBar: AppBar(
              title: Text('Question$questionnum'),
            ),
            body: Consumer<QuizModel>(
              builder: (context, model, child){
                final anslist = model.anslist;
                final quizlist = model.quizlist;
                if(quizlist == null || quizlist.length == 0) {
                  return Container(
                    child: Center(
                      child: Text('Loading...',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                      ),
                    ),
                  );
                }
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(30),
                              child: Text('Q$questionnum',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                              ),
                          ),
                          Expanded(
                            child: Text(quizlist[num].question,
                            style: TextStyle(
                              fontSize: 20
                            ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 200,),
                      Expanded(
                        child: ListView(
                          children: anslist
                              .map((answer) => ChoiceCard(
                              tilenum: anslist.indexOf(answer) + 1,
                              num: num,
                              answer: answer,
                              correctchoice: model.getCorrectAnswer(),
                              cansolve: cansolve,
                              uid: uid,
                            ),
                            ).toList(),
                          ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
    );
  }
}

class ChoiceCard extends StatelessWidget{
  ChoiceCard({
    this.answer,
    this.tilenum,
    this.num,
    this.correctchoice,
    this.cansolve,
    this.uid
});
 final Answer answer;
 final int tilenum;
 final correctchoice;
 final uid;
  int cansolve;
  int num;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          leading: Text('($tilenum)',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          title: Center(
            child: Text(answer.choicetext,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          onTap: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultPage(
            num: num,
            isTrue: answer.isTrue,
            correctchoice: correctchoice,
            cansolve: cansolve,
            uid: uid,
          )),
          );
          },
        ),
      ),
    );
  }
}