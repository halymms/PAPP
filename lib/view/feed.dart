import 'package:flutter/material.dart';

import 'package:trabalho_app/colors/colors.dart';
import 'package:trabalho_app/drawer/drawer.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
  return Center(
      child: GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 12,
        padding: EdgeInsets.all(20),
        childAspectRatio: 8 / 7.5,
        children: <Widget>[
          Card(
            color: corBege,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () async {
                //INSERIR ROTA
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18 / 13,
                    child: Image.asset('img/perdido1.jpg', fit: BoxFit.fitWidth),
                  ),
                  new ListTile(
                    title: Text("Teste01",  textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Perdido em: Rua Pastor Carlos Frank", textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  ),

                ],
              ),
            ),
          ),
          Card(
            color: corBege,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () async {
//
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18 / 13,
                    child: Image.asset('img/perdido2.jpg', fit: BoxFit.fitWidth),
                  ),

                  new ListTile(
                    title: Text("Teste02",  textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Perdido em: Rua Maria de Lourdes Kudri", textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
                  ),

                ],
              ),
            ),
          ),
          Card(
            color: corBege,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () async {
                //INSERIR ROTA

              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18 / 13,
                    child: Image.asset('img/perdido3.jpg', fit: BoxFit.fitWidth),
                  ),

                  new ListTile(
                    title: Text("Teste03",  textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Perdido em: Rua Izabel Lima de Oliveira", textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
                  ),

                ],
              ),
            ),
          ),
          Card(
            color: corBege,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () async {
                //INSERIR ROTA
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18 / 13,
                    child: Image.asset('img/viralata4.jpg', fit: BoxFit.fitWidth),
                  ),

                  new ListTile(
                    title: Text("Teste04", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Perdido em: Rua Doutor Hugo Camargo", textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
                  ),

                ],
              ),
            ),
          ),
        ],
      ));
}