import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_up_to_you_app/screen/login.dart';
import 'package:quiz_up_to_you_app/screen/sign_up.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.redAccent,
      ),
      home: TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  final int num = 0;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            Image.asset('images/topscreen.jpg'),
            Column(
              children: [
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,//後で白にする
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('QUIZ Up To You へようこそ',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      ),

                      Text('あなただけのクイズを作りませんか？'),
                      Text('勉強用に四択クイズを作成できます。'),
                      SizedBox(height: 30,),
                      Text('<アカウントをお持ちでない方はこちらから>'),
                      SizedBox(height: 10,),
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Text('新規登録',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                        onPressed: (){
                          //todo: 新規登録ページへ飛ぶ
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );
                        },
                      ),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Spacer(),
                          Text('すでにアカウントを持っていますか？'),
                          TextButton(
                            child: Text('ログイン'),
                            onPressed: (){
                              //todo :ログインページへ飛ぶ 以下はテストとしてQuizPageへ飛ぶ
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()
                                ),
                              );
                               },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
