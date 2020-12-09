import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_to_you_app/model/login_model.dart';
import 'package:quiz_up_to_you_app/screen/menu.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passWordController = TextEditingController();
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規登録画面'),
        ),
        body: Consumer<LoginModel>(
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
                          await model.logIn();
                          _showDialog(context, 'ログイン完了');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage(uid: model.uid,))
                              );
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