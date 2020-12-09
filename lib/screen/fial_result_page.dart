import 'package:flutter/material.dart';
import 'package:quiz_up_to_you_app/screen/menu.dart';

class FinalResultPage extends StatelessWidget{
  FinalResultPage({
    this.cansolve,
    this.quizsum,
    this.uid,
});
  final cansolve;
  final quizsum;
  final uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text('最終結果',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              Text('$cansolve/$quizsum',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              TextButton(
                child: Text('TOPへ戻る'),
                onPressed: (){
                  //todo 次のクイズへ遷移
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuPage(uid: uid,))
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}