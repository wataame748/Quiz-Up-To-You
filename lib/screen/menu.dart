import 'package:flutter/material.dart';
import 'package:quiz_up_to_you_app/screen/quiz_page.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メニュー画面'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200,),
              Text('総問題数〇〇問',
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
                    MaterialPageRoute(builder: (context) => QuizPage(num: 0,)),
                  );
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.redAccent[100],
                child: Text('問題を追加、編集する'),
                onPressed: (){
                  //問題をページへ飛ぶ
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}