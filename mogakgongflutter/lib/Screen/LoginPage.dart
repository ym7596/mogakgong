import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    size: 80,
                  ),

                ),
              ]
          ),
        ),
      ),
    );
  }
}
