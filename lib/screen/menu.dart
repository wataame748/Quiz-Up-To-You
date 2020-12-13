import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/model/quiz_page_model.dart';
import 'package:quiz_up_to_you_app/screen/quiz_add_page.dart';
import 'package:quiz_up_to_you_app/screen/quiz_edit_page.dart';
import 'package:quiz_up_to_you_app/screen/quiz_page.dart';

class MenuPage extends StatelessWidget{
  MenuPage({
    this.uid,
});
  final uid;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizModel>(
      create: (_) => QuizModel()..getQuizList(uid),
      child: Scaffold(
        appBar: AppBar(
          title: Text('メニュー画面'),
        ),
        body: Consumer<QuizModel>(
          builder: (context, model, child) {
            final quizlist = model.quizlist;
            final quizsum = quizlist.length;
            return Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 200,),
                    Text('総問題数 $quizsum問',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      color: Colors.redAccent[100],
                      child: Text('問題を解く'),
                      onPressed: (){
                        //todo:問題を解くページへ飛ぶ
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPage(
                            num: 0,
                            cansolve: 0,
                            uid: uid,
                          )),
                        );
                      },
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      color: Colors.redAccent[100],
                      child: Text('問題を追加する'),
                      onPressed: (){
                        //todo 問題をページへ飛ぶ
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddQuizPage(
                            num: quizsum + 1,
                            uid: uid,
                          )),
                        );
                      },
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      color: Colors.redAccent[100],
                      child: Text('問題を編集する'),
                      onPressed: (){
                        //問題をページへ飛ぶ
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizEditPage(
                            uid: uid,
                          )),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}