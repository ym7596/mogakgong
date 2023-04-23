import 'package:flutter/material.dart';
import 'package:mogakgongflutter/Screen/LoginPage.dart';
import 'package:mogakgongflutter/Screen/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/home':(context) => HomeScreen()
      },
    );
  }
}

