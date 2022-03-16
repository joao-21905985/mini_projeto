import 'package:flutter/material.dart';
import 'package:mini_projeto/blocs/general_bloc.dart';
import 'package:mini_projeto/screens/form_register_screen.dart';
import 'package:mini_projeto/screens/list_screen.dart';
import 'package:mini_projeto/widgets/CardGridWidget.dart';
import 'package:mini_projeto/widgets/CardWidget.dart';

class Home_Screen extends StatefulWidget {
  general_bloc bloc;

  Home_Screen(this.bloc, {Key? key}) : super(key: key);

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
      ),
      body: Column(
        children: <Widget>[
          CardWidget(bloc: widget.bloc),
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
    );
  }
}
