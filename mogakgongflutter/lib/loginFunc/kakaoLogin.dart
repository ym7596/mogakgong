import 'package:flutter/material.dart';
import 'package:http/http.dart';

class KakaoLogin extends StatefulWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  State<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  bool _isKakaoInstalled = false;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("press");
      },
      child: Image(
        image: AssetImage('assets/images/kakaologin.png'),
        fit: BoxFit.cover,
        height: 50,
      ),
    );
  }
}
