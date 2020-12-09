import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/model/add_quiz_model.dart';
import 'package:quiz_up_to_you_app/screen/menu.dart';

class AddQuizPage extends StatelessWidget{
  AddQuizPage({
    this.num,
    this.uid,
});
  int num;
  final uid;
  @override
  Widget build(BuildContext context) {
    final questionController = TextEditingController();
    final ans1Controller = TextEditingController();
    final ans2Controller = TextEditingController();
    final ans3Controller = TextEditingController();
    final ans4Controller = TextEditingController();
    return ChangeNotifierProvider<AddQuizModel>(
      create: (_) => AddQuizModel(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            },
          ),
          title: Text('QUIZを追加する'),
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
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Consumer<AddQuizModel>(
              builder: (context, model, child) {
                model.num = num;
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('Q$num',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: '問題文',
                                hintText: '(例)江戸幕府初代将軍はだれか？'
                            ),
                            controller: questionController,
                            onChanged: (text){
                              //todo quizlistに追加する処理
                              model.question = text;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    TextField(
                      decoration: InputDecoration(
                          labelText: '正解の選択肢',
                          hintText: '(例)徳川家康',
                      ),
                      controller: ans1Controller,
                      onChanged: (text){
                        //todo quizlistに追加する処理
                        model.choicetext1 = text;
                        model.isTrue1 = true;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: '不正解の選択肢1',
                          hintText: '(例)坂上田村麻呂'
                      ),
                      controller: ans2Controller,
                      onChanged: (text){
                        //todo
                        model.choicetext2 = text;
                        model.isTrue2 = false;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: '不正解の選択肢2',
                          hintText: '(例)源頼朝',
                      ),
                      controller: ans3Controller,
                      onChanged: (text){
                        //todo
                        model.choicetext3 = text;
                        model.isTrue3 = false;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: '不正解の選択肢3',
                          hintText: '(例)足利尊氏'
                      ),
                      controller: ans4Controller,
                      onChanged: (text){
                        //todo
                        model.choicetext4 = text;
                        model.isTrue4 = false;
                      },
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      color: Colors.redAccent[100],
                      child: Text('登録する',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async{
                        model.createdAt = Timestamp.now();
                        try{
                          await model.addQuiz(uid);
                          await model.addAnswer1(uid);
                          await model.addAnswer2(uid);
                          await model.addAnswer3(uid);
                          await model.addAnswer4(uid);
                          _showDialog(context, '登録成功');
                          ++num;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddQuizPage(uid: uid, num: num,))
                          );
                        }catch(e){
                          _showDialog(context, '登録に失敗しました');
                        }
                        /*
                        try{
                          await model.logIn();
                          _showDialog(context, 'ログイン完了');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage(uid: model.uid,))
                          );
                        }catch(e){
                          _showDialog(context, e.toString());
                        }*/
                      },
                    ),
                  ],
                );
              }
            ),
          ),
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