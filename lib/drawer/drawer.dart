import 'package:flutter/material.dart';
import 'package:trabalho_app/colors/colors.dart';

class DrawerWidget extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20.0,

      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('User', style: TextStyle(color: corBranco),),
            accountEmail: Text('User@gmail.com', style: TextStyle(color: corBranco),),
            currentAccountPicture: 
                CircleAvatar(
                  backgroundColor: corBege,
                  child: Text('U', style: TextStyle(fontSize: 40.0, color: corMarrom),),
                ),
            decoration: BoxDecoration(color: corMarrom),
          ),
          Divider(height: 2.0,),

          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil', style: TextStyle(fontSize: 20),),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),

          new ListTile(
            leading: Icon(Icons.keyboard_backspace),
            title: Text('Sair', style: TextStyle(fontSize: 20),),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),



        ],
      ),
    );
  }
}
