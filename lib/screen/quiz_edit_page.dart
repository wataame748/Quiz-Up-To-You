import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/model/edit_quiz_model.dart';
import 'package:quiz_up_to_you_app/screen/menu.dart';

import 'quiz_edit_detail_page.dart';

class QuizEditPage extends StatelessWidget{
  QuizEditPage({
    this.uid,
});
  final uid;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizEditModel>(
      create: (_) => QuizEditModel()..getQuizRealTime(uid),
      child: Scaffold(
        appBar: AppBar(
          title: Text('問題を編集する'),
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
            final quizlist = model.quizlist;
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Text('問題一覧',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25
                    ),
                    ),
                  ),
                  Text('詳細を見るにはタップしてください'),
                  Expanded(
                    child: ListView(
                      children: quizlist
                          .map((quiz) => Card(
                        color: Colors.redAccent[100],
                        child: ListTile(
                        leading: Text(quiz.getQuizNumText(quiz.quiznum)),
                        title: Text(quiz.question),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async{
                              //todo QuizとAnswerを消去する処理
                              _showDialog(context, '消去しました');
                              await model.deleteQuiz(quiz, uid);
                              await model.deleteAnsCollection(uid, quiz.quiznum);
                            },
                        ),
                        onTap: (){
                            //todo 詳細へ飛ぶ処理
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuizEditDetailPage(
                              uid: uid,
                              quiz: quiz,
                            )),
                          );*/
                        },
                      ),
                          ))
                          .toList(),
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
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
}