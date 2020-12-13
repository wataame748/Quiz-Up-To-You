
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/model/edit_quiz_model.dart';
import 'package:quiz_up_to_you_app/quiz.dart';
import 'package:quiz_up_to_you_app/screen/menu.dart';
import 'package:quiz_up_to_you_app/screen/quiz_edit_page.dart';



class QuizEditDetailPage extends StatelessWidget{
  QuizEditDetailPage({
    this.uid,
    this.quiz
});
  final uid;
  final Quiz quiz;
  @override
  Widget build(BuildContext context) {
    final questionController = TextEditingController();
    return ChangeNotifierProvider<QuizEditModel>(
      create: (_) => QuizEditModel()..getAnswerRealTime(uid, quiz.quiznum),
      child: Scaffold(
        appBar: AppBar(
          title: Text('問題,選択肢に変更を加える'),
          actions: [
            IconButton(
              icon: Icon(Icons.done),
              onPressed: (){
                //todo 登録完了したためMENUへ戻る
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuPage(uid: uid,))
                );
              },
            )
          ],
        ),
        body: Consumer<QuizEditModel>(
          builder: (context, model, child) {
            final anslist = model.anslist;
            String docID = '';
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('(変更前):' + quiz.question),
                  TextField(
                    controller: questionController,
                    decoration: InputDecoration(
                     labelText: '(変更後):'
                    ),
                    onChanged: (text){
                      model.question = text;
                    },
                  ),
                  SizedBox(height:10),
                  Text('<選択肢>'),
                  Expanded(
                    child: ListView(
                      children: anslist
                      .map((answer) => TextField(
                        decoration: InputDecoration(
                          labelText: '(変更前):' + answer.choicetext,
                          hintText: '(変更後)'
                        ),
                        onChanged: (text){
                          model.choicetext = text;
                          docID = answer.documentID;
                        },
                      )).toList(),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.redAccent[100],
                    child: Text('登録する',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async{
                      try{
                        await model.updateQuiz(uid, quiz);
                        await model.updateAnswer(uid, docID, quiz.quiznum);
                        _showDialog(context, '登録成功');
                      }catch(e){
                        _showDialog(context, '登録に失敗しました');
                      }
                    },
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
  Future _showDialog(
      BuildContext context,
      String title,
      ) {
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            actions: [
              FlatButton(
                child: Text('OK'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizEditPage(
                      uid: uid,
                    )),
                  );
                },
              )
            ],
          );
        }
    );
  }
}