import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(children: [
          Row(children: [
            Text(
              "Comeu nas últimas 3 horas ?",
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 100, 100, 100)),
            ),
            Container(
              child: Checkbox(
                value: isChecked,
                activeColor: Colors.green,
                onChanged: (val) {
                  setState(() {
                    if (val != null) isChecked = val;
                  });
                },
              ),
            ),
          ]),
        ]));
  }
}
