import 'package:flutter/material.dart';
import 'package:quiz_up_to_you_app/screen/fial_result_page.dart';
import 'package:quiz_up_to_you_app/screen/quiz_page.dart';

class ResultPage extends StatelessWidget{
  ResultPage({
    this.isTrue,
    this.num,
    this.correctchoice,
    this.cansolve,
    this.uid,
    this.quizsum,
});
  final isTrue;
  final correctchoice;
  final uid;
  final quizsum;
  int cansolve;
  int num;
  @override
  Widget build(BuildContext context) {
    if(isTrue){
      ++cansolve;
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
                Text('ただ今の正解数 $cansolve/$quizsum',),
                SizedBox(height: 30,),
                TextButton(
                  child: Text('次の問題へ'),
                  onPressed: (){
                    //todo 次のクイズへ遷移
                    if(num + 1 == quizsum){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinalResultPage(
                          quizsum: quizsum,
                          cansolve: cansolve,
                          uid: uid,
                        )),
                      );
                    }else {
                      ++num;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            QuizPage(
                              num: num,
                              cansolve: cansolve,
                              uid: uid,
                            )),
                      );
                    }
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
                Text('ただ今の正解数 $cansolve/$quizsum',),
                TextButton(
                  child: Text('次の問題へ'),
                  onPressed: (){
                    //todo 次のクイズへ遷移
                    if(num + 1 == quizsum){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinalResultPage(
                          quizsum: quizsum,
                          cansolve: cansolve,
                          uid: uid,
                        )),
                      );
                    }else {
                      ++num;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            QuizPage(
                              num: num,
                              cansolve: cansolve,
                              uid: uid,
                            )),
                      );
                    }
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
