// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'package:trabalho_app/colors/colors.dart';
import 'package:trabalho_app/view/home.dart';
import 'package:trabalho_app/view/login.dart';
import 'package:trabalho_app/view/found.dart';
import 'package:trabalho_app/view/lost.dart';
import 'package:trabalho_app/view/profile.dart';
import 'package:trabalho_app/view/register.dart';
import 'package:trabalho_app/view/feed.dart';


class PetApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PET APP',
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/found': (context) => FoundPage(),
        '/lost': (context) => LostPage(),
        '/profile': (context) => ProfilePage(),
        '/register': (context) => RegisterPage(),
        '/feed': (context) => FeedPage(),
        '/login': (context) => LoginPage(),


      },
      onGenerateRoute: _getRoute,
      theme: _petTheme,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _petTheme = _buildPetTheme();

ThemeData _buildPetTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: corMarrom,
    primaryColor: corLaranja,
    buttonColor: corMarrom,
    scaffoldBackgroundColor: corBege,
    textSelectionColor: corCinza,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: corMarrom,
      textTheme: ButtonTextTheme.normal,
    ),
    textTheme: _buildPetTextTheme(base.textTheme),
    primaryTextTheme: _buildPetTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildPetTextTheme(base.accentTextTheme),

  );
}

TextTheme _buildPetTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'JosefinSans',
    displayColor: corMarrom,
    bodyColor: corMarrom,
  );
}