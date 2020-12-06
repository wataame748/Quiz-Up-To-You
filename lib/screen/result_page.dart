import 'package:flutter/material.dart';
import 'package:quiz_up_to_you_app/screen/quiz_page.dart';

class ResultPage extends StatelessWidget{
  ResultPage({
    this.isTrue,
    this.num,
    this.correctchoice,
});
  final isTrue;
  final correctchoice;
  int num;
  @override
  Widget build(BuildContext context) {
    if(isTrue){
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Text('正解',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30,),
                Icon(Icons.check_circle_outline_rounded,
                color: Colors.redAccent,
                size: 100,
                ),
                SizedBox(height: 30,),
                TextButton(
                  child: Text('次の問題へ'),
                  onPressed: (){
                    //todo 次のクイズへ遷移
                    ++num;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage(num: num,)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }else if(isTrue == false){
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Text('不正解',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 30,),
                Icon(Icons.clear,
                  color: Colors.blueAccent,
                  size: 100,
                ),
                SizedBox(height: 30,),
                Text('正解は',
                style: TextStyle(
                  fontSize: 20
                ),
                ),
                Text('$correctchoice',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                TextButton(
                  child: Text('次の問題へ'),
                  onPressed: (){
                    //todo 次のクイズへ遷移
                    ++num;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage(num: num,)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }else{
      //todo エラーのためトップページへ戻る
    }
  }
}