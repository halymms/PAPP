import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:trabalho_app/drawer/drawer.dart';
import 'package:trabalho_app/colors/colors.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Stack(
      children: <Widget>[
        new Container(color: corBege,),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color:  corMarrom,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),)),
        new Scaffold(
            backgroundColor: corBege,
            appBar: new AppBar(
              title: new Text("PetApp"),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: corMarrom,
            ),
            drawer: DrawerWidget(),
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(height: _height/12,),
                  new CircleAvatar(radius:_width<_height? _width/4:_height/4, backgroundColor: corBege,
                    child:  Container(
                      decoration: new BoxDecoration(
                        color: corMarrom,
                        shape: BoxShape.circle,
                        border: new Border.all(
                          color: corMarrom,
                          width: 3,
                        ),
                      ),
                      child: new CircleAvatar(
                        radius: 200.0,
                        backgroundColor: corMarrom,
                        child: ClipOval(
                          child: Image.asset(
                            'img/semfoto.png',
                          ),
                        ),
                      ),
                    ), ),
                  new SizedBox(height: _height/25.0,),
                  new ListTile(
                    title: Text("User",  textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    subtitle: Text("Eu gosto de animais", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                  ),
                  new SizedBox(height: _height/25.0,),

                ],
              ),
            )
        )
      ],);
  }

  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: corMarrom),),
    new Text(type,style: new TextStyle(color: corMarrom, fontWeight: FontWeight.normal))
  ],));
}
