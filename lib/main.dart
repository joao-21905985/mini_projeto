
import 'package:flutter/material.dart';
import 'package:mini_projeto/blocs/general_bloc.dart';
import 'package:mini_projeto/screens/list_screen.dart';
import 'package:mini_projeto/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final general_bloc bloc = general_bloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IqueChumbei",
      theme: ThemeData(primaryColor: Colors.white),
      home: Home_Screen( )
    );
  }
}