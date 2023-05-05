import 'package:flutter/material.dart';
import 'package:mogakgongflutter/Screen/LoginPage.dart';
import 'package:mogakgongflutter/Screen/homeScreen.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
void main() {
  //Un1QJD84Al0/Mj8sfj9Ufw0K
  //hash 값
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'e36b911c89bdbce80bc30c00e3ee211e',
    javaScriptAppKey: '814fa309e1f65e90330e1de86622bff8',
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home':(context) => HomeScreen()
      },
    );
  }
}

