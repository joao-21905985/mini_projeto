import 'package:flutter/material.dart';
import 'package:mini_projeto/blocs/general_bloc.dart';
import 'package:mini_projeto/screens/form_register_screen.dart';
import 'package:mini_projeto/screens/list_screen.dart';
import 'package:mini_projeto/widgets/CardGridWidget.dart';
import 'package:mini_projeto/widgets/CardWidget.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);


  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with SingleTickerProviderStateMixin {
  final colorstheme = Color(0xff0d0432);

  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("IqueChumbei",
            style: TextStyle(
                fontSize: 27, color: colorstheme, fontWeight: FontWeight.bold)),
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
      body: Column(
        children: <Widget>[
          CardWidget(content: "day 1"),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400]),
              child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: colorstheme,
                  labelStyle: TextStyle(fontSize: 20),
                  labelPadding:
                      EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                  indicator: BoxDecoration(
                      color: colorstheme,
                      borderRadius: BorderRadius.circular(20)),
                  controller: _tabController,
                  tabs: [
                    Text("7 Days"),
                    Text("30 Days"),
                  ])),
          Expanded(
              child: TabBarView(controller: _tabController, children: [
            CardGridWidget(),
            CardGridWidget(),
          ])),
        ],
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
              padding: const EdgeInsets.only(left: 50.0, top: 10.0, bottom: 10.0),
              child: TextButton.icon(
                icon: Icon(Icons.home),
                label: Text("Home"),
                style: TextButton.styleFrom(
                  primary: colorstheme,
                 textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                onPressed: (){
                  _navigateToHomeScreen(context);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right:50.0),
              child: TextButton.icon(
                icon: Icon(Icons.list),
                label: Text("Registos"),
                style: TextButton.styleFrom(
                    primary: Colors.black54,
                    textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                onPressed: (){
                  _navigateToListScreen(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _navigateToListScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => List_Screen()));
}

void _navigateToNewEntry(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormScreen()));
}
void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home_Screen()));
}
