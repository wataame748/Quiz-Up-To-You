import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/model/sign_up_model.dart';

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
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'mail address',
                      hintText: 'example@mail.com'
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
                        _showDialog(context, e.toString());
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
    showDialog(
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