import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/model/sign_up_model.dart';
import 'package:quiz_up_to_you_app/screen/login.dart';
import 'package:quiz_up_to_you_app/screen/main.dart';

class SignUpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passWordController = TextEditingController();
    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規登録画面'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TopPage()
                ),
              );
            },
          ),
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'your mail address',
                      hintText: 'example@email.com'
                    ),
                    controller: mailController,
                    onChanged: (text){
                      //todo
                      model.mail = text;
                    },
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'password',
                    ),
                    obscureText: true,
                    controller: passWordController,
                    onChanged: (text){
                      //todo
                      model.password = text;
                    },
                  ),
                  SizedBox(height: 40,),
                  RaisedButton(
                    color: Colors.redAccent[100],
                    child: Text('登録する',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                    onPressed: () async{
                      //todo
                      try{
                        await model.signUp();
                        _showDialog(context, '登録完了');
                      }catch(e){
                        _showDialog(context, '新規登録に失敗');
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
                  MaterialPageRoute(
                      builder: (context) => LoginPage()
                  ),
                );
              },
            )
          ],
        );
      }
    );
  }
}