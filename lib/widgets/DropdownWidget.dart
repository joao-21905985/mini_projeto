import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  var selected = 1;
  final dropdownList = <int>[1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Row(children: [
        Text(
          "Como se sente Hoje? (1 a 5)",
          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 102, 102, 102)),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: DropdownButton(
            value: selected,
            items: dropdownList
                .map((e) =>
                    DropdownMenuItem(value: e, child: Text(e.toString())))
                .toList(),
            onChanged: (int? val) {
              setState(() {
                if (val != null) selected = val ;
              });
            },
          ),
        ),
      ]),
    ]));
  }
}
