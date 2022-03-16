import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_projeto/models/list_item.dart';

import '../models/registos.dart';

class ListItemWidget extends StatelessWidget {
  final Registos item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.ease)),
        child: buildItem(),
      );

  buildItem() =>
      Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.indigoAccent,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Colors.green,
            ),
            label: Text('Editar'),
            style: ElevatedButton.styleFrom(
                primary: Colors.black26,
                textStyle: TextStyle(color: Colors.white)),
          ),
          title: Text("Peso: ${item.weight}" +
              "  |  Feeling: ${item.feelAval}" +
              "  |  Date:  ${item.getDate()}"
          ),
          trailing: ElevatedButton.icon(
            onPressed: onClicked,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: Text('Delete'),
            style: ElevatedButton.styleFrom(
                primary: Colors.black12,
                textStyle: TextStyle(color: Colors.white)),
          ),
        ),
      );
}
