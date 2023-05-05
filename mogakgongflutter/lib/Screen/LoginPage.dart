import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter/material.dart';
import 'package:mogakgongflutter/Constant/platforms.dart';
import 'package:mogakgongflutter/loginFunc/kakaoLogin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  LoginPlatform _loginPlatform = LoginPlatform.none;
  AnimationController? _animationController;

  Animation? _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation = Tween<double>(begin: 0, end: pi * 2).
    animate(_animationController!);
    _animationController!.repeat();
  }

  void getuserinfo() async {
    try {
      User user = await UserApi.instance.me();
      print('info success'
      '\nNum: ${user.id}'
      '\nnick: ${user.kakaoAccount?.profile?.nickname}');
    }catch(error){
      print('fail');
    }
  }

  void signInWithKakao() async {
    OAuthToken? token;

    if(await isKakaoTalkInstalled()){
      try{
        print('kakao login success');
        print(await KakaoSdk.origin);
         token =  await UserApi.instance.loginWithKakaoTalk();
        print(token);
         getuserinfo();
      }
      catch(error){
        print('login fail $error');

        if(error is PlatformException && error.code == 'CANCELED'){
          return;
        }


      }
    }
    else{
      try{
        print('kakao login success2');
        print(await KakaoSdk.origin);
         token = await UserApi.instance.loginWithKakaoAccount();
         getuserinfo();
       // var tokenResponse = AccessTokenResponse.fromJson(response);
        print(token);
      }
      catch(error){
        print('acccount fail');
      }

    }
    if(token != null){
     // Map<String,dynamic>? response = await userS
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedBuilder(
                  animation: _animationController!,
                  builder: (context, widget) {
                    return Transform.rotate(
                      angle: _animation!.value,
                      child: widget,
                    );
                  },
                  child: Icon(
                    Icons.punch_clock_rounded,
                    color: Colors.deepOrangeAccent,
                    size: 120,
                  ),

                ),
                SizedBox(
                  height: 50,
                    child: Text("MoGakGong",
                    ),
                ),
                SizedBox(
                  height: 50,
                  width: 230,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Image.asset('assets/images/Google.png'),
                  )
                ),

                SizedBox(
                    height: 50,

                    child: GestureDetector(
                      onTap: () {
                        signInWithKakao();
                        print("press");
                      },
                      child: Image(
                        image: AssetImage('assets/images/kakaologin.png'),
                        fit: BoxFit.cover,
                        height: 50,
                      ),
                    )
                )

              ]
          ),
        ),

    );
  }
}
