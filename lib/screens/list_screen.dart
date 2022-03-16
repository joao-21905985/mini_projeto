import 'package:flutter/material.dart';
import 'package:mini_projeto/blocs/general_bloc.dart';
import '../data/data.dart';
import '../models/list_item.dart';
import '../widgets/ListItemWidget.dart';
import 'form_register_screen.dart';
import 'home_screen.dart';

class List_Screen extends StatefulWidget {
  general_bloc bloc;

  List_Screen(this.bloc, {Key? key}) : super(key: key);

  @override
  State<List_Screen> createState() => _List_ScreenState();
}

class _List_ScreenState extends State<List_Screen> {

  //final List<ListItem> items = List.from(listItems);


  final listKey = GlobalKey<AnimatedListState>();
  final colorstheme = Color(0xff0d0432);


  @override
  Widget build(BuildContext context) {
    widget.bloc.orderList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Lista de Registos",
            style: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        shadowColor: Colors.blue,
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount:  widget.bloc.listItems.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item:   widget.bloc.listItems[index],
          animation: animation,
          onClicked: () => removeItem(index),
        ),
      ),
    );
  }

  void removeItem(int index) {
    final removedItem =  widget.bloc.listItems[index];

    widget.bloc.listItems.removeAt(index);
    listKey.currentState!.removeItem(
        index,
        (context, animation) => ListItemWidget(
            item: removedItem, animation: animation, onClicked: () {}));
  }
}
