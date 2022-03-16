import 'package:flutter/material.dart';
import 'package:mini_projeto/blocs/general_bloc.dart';

class CardWidget extends StatelessWidget {

  final general_bloc bloc;

  CardWidget({required this.bloc});

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
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.all(18.0),
                height: MediaQuery.of(context).size.height / 5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    const Text("Primeiro Registo - ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )
                    ),
                    Text(bloc.listItems[bloc.listItems.length -1 ].getDate(),

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
                    Text(bloc.listItems[0].getDate(),
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
