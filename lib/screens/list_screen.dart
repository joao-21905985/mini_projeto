import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/list_item.dart';
import '../widgets/ListItemWidget.dart';
import 'form_register_screen.dart';
import 'main_screen.dart';

class List_Screen extends StatefulWidget {
  const List_Screen({Key? key}) : super(key: key);




  @override
  State<List_Screen> createState() => _List_ScreenState();
}

class _List_ScreenState extends State<List_Screen> {

  final List<ListItem> items = List.from(listItems);

  final listKey = GlobalKey<AnimatedListState>();
  final colorstheme = Color(0xff0d0432);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Lista de Registos",
            style: TextStyle(
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        shadowColor: Colors.blue,
        /*  leading: IconButton(
          icon: Icon(
              Icons.arrow_back,
          color: colorstheme,
          iconSize: 25,
          onPressed: () {},
        ),
      */
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: items[index],
          animation: animation,
          onClicked: () => removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          _navigateToNewEntry(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 50.0, top: 10.0, bottom: 10.0),
              child: TextButton.icon(
                icon: Icon(Icons.home),
                label: Text("Home"),
                style: TextButton.styleFrom(
                    primary: Colors.black54,
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  _navigateToHomeScreen(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: TextButton.icon(
                icon: Icon(Icons.list),
                label: Text("Registos"),
                style: TextButton.styleFrom(
                    primary: colorstheme,
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  _navigateToListScreen(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(
        index,
        (context, animation) => ListItemWidget(
            item: removedItem, animation: animation, onClicked: () {}));
  }
}

void _navigateToListScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => List_Screen()));
}

void _navigateToNewEntry(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => FormScreen()));
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => Home_Screen()));
}
