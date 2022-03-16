import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final content;

  CardWidget({this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black54),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.all(18.0),
                height: MediaQuery.of(context).size.height / 5,
                child: Column(children: [
                  Row(children: [
                    const Text("Primeiro Registo - ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )),
                    Text(content,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        )),
                  ]),
                  Row(children: [
                    const Text("Último Registo - ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )),
                    Text(content,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        )),
                  ])
                ])),
          )
        ],
      ),
    );
  }
}
