import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/quiz.dart';
import 'package:quiz_up_to_you_app/quiz_page_model.dart';
import 'package:quiz_up_to_you_app/result_page.dart';

class QuizPage extends StatelessWidget{
  QuizPage({
    this.num
});
  int num;
  @override
  Widget build(BuildContext context) {

    final questionnum = num + 1;
    return ChangeNotifierProvider<QuizModel>(
      create: (_) => QuizModel()..getQuizList()..getAnsList(questionnum),
      child: Scaffold(
            appBar: AppBar(
              title: Text('Question$questionnum'),
            ),
            body: Consumer<QuizModel>(
              builder: (context, model, child){
                final anslist = model.anslist;
                final quizlist = model.quizlist;
                if(quizlist == null || quizlist.length == 0) {
                  return Container();
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
});
 final Answer answer;
 final int tilenum;
 final correctchoice;
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
          MaterialPageRoute(builder: (context) => ResultPage(num: num, isTrue: answer.isTrue, correctchoice: correctchoice,)),
          );
          },
        ),
      ),
    );
  }
}