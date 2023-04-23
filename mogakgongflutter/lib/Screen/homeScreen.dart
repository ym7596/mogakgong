import 'package:flutter/material.dart';
import 'dart:math';


class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("모각공 by dduR"),

      ),
      body: Column(
        children: [

        ],
      )
    );
  }
}
