import 'package:flutter/material.dart';
import 'package:trabalho_app/colors/colors.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBege,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 120.0),

            Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                Image.asset("img/papp1.png",height: 200.0, width: 300,),
                SizedBox(height: 5,)
              ],
            ),
            SizedBox(height: 50.0),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                labelText: 'Email',
              ),
            ),

            SizedBox(height: 12.0),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                labelText: 'Senha',
              ),
              obscureText: true,
            ),

            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Criar uma conta'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
                RaisedButton(
                  child: Text('ENTRAR',style: TextStyle(color: corBranco, fontSize: 13),),
                  elevation: 8.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

