
import 'package:flutter/material.dart';
import 'package:mini_projeto/blocs/general_bloc.dart';
import 'package:mini_projeto/screens/form_register_screen.dart';
import 'package:mini_projeto/screens/list_screen.dart';
import 'package:mini_projeto/screens/home_screen.dart';
import 'package:mini_projeto/screens/main_screen.dart';

void main() {
  final app=MyApp();
  app.initState();
  runApp(app);

}

class MyApp extends StatelessWidget {

  final bloc = general_bloc();

  void initState(){
    for (int i = 0 ; i < bloc.listItems.length ; i++ ){
      bloc.listItems[i].dateTime = DateTime.now().subtract(Duration(days:i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(
        screens: [
          Home_Screen(bloc),
          FormScreen(bloc),
          List_Screen(bloc)

        ],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Novo Registo"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Registos"
          ),
        ],
      ),
    );
  }
}