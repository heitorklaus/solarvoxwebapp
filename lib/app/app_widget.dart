// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      initialRoute: '/',
      theme: ThemeData(
          fontFamily: 'Barlow',
          textTheme: TextTheme(
              headline1: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Barlow',
                fontWeight: FontWeight.bold,
              ),
              headline2: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: 'Barlow',
                fontWeight: FontWeight.bold,
              ),
              headline3: const TextStyle(
                  fontSize: 40, color: Colors.black, fontFamily: 'Barlow'),
              subtitle1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
              subtitle2: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              bodyText1: const TextStyle(
                  fontSize: 20, color: Colors.black, height: 1.25),
              bodyText2: const TextStyle(
                  fontSize: 17, color: Colors.black, height: 1.25),
              caption: const TextStyle(
                  fontSize: 15, color: Colors.black, height: 1.25),
              button: const TextStyle(fontSize: 17, color: Color(0xff000000)))),
    ).modular();
  }
}
