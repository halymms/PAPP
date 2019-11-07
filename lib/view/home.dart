import 'package:flutter/material.dart';
import 'package:trabalho_app/drawer/drawer.dart';
import 'package:trabalho_app/colors//colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: corCinza,
        appBar: AppBar(
          backgroundColor: corMarrom,
          title: Text('PET APP', style: TextStyle(color: corBranco)),
        ),
        drawer: DrawerWidget(),
        body: getBody(context));
  }
}

Widget getBody(BuildContext context) {
  return Center(child: GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    padding: EdgeInsets.all(20),
    childAspectRatio: 8 / 9,
    children: <Widget>[
      Card(
        color: corBege,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () async {
            Navigator.pushNamed(context, '/found');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 13,
                child: Image.asset('img/viralata1.png', fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text('Encontrei \num animal',
                      style: TextStyle(fontSize: 15)),
                ),
              )
            ],
          ),
        ),
      ),
      Card(
        color: corBege,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () async {
            Navigator.pushNamed(context, '/lost');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 13,
                child: Image.asset('img/viralata4.jpg', fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text('Perdi meu \n   animal',
                      style: TextStyle(fontSize: 15)),
                ),
              )
            ],
          ),
        ),
      ),
      Card(
        color: corBege,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () async {
            Navigator.pushNamed(context, '/feed');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 13,
                child: Image.asset('img/viralata2.jpg', fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Center(
                  child:
                      Text('Procurar animais', style: TextStyle(fontSize: 15)),
                ),
              )
            ],
          ),
        ),
      ),
      Card(
        color: corBege,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () async {
            Navigator.pushNamed(context, '/profile');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 13,
                child: Image.asset('img/viralata3.jpg', fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18),
                child: Center(
                  child: Text('Minha conta', style: TextStyle(fontSize: 15)),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  ));
}
