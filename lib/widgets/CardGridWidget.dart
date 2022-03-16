import 'package:flutter/material.dart';

class CardGridWidget extends StatelessWidget {

  List data = [
    {"color": Color(0xffff6968)},
    {"color": Color(0xff5a65ff)},
    {"color": Color(0xffff8f61)},
    {"color": Color(0xff96da45)},
  ];

  List<Map> randomTester =
      List.generate(10, (index) => {"id": index, "name": "Product $index"})
          .toList();


  final colorwhite = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                color: data[index]["color"],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Média Peso",
                            style: TextStyle(color: colorwhite, fontSize: 16),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                color: Color.fromRGBO(255, 255, 255, 0.38)),
                            child: Icon(Icons.assessment_rounded,
                                color: colorwhite, size: 30),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 50, bottom: 50),
                          child: Text(
                            randomTester[index]["name"],
                            style: TextStyle(fontSize: 27, color: colorwhite),
                          )),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Text(
                                '  Healthy',
                                style:
                                    TextStyle(fontSize: 18, color: colorwhite),
                              ),
                              Text(
                                '  Cancer',
                                style:
                                    TextStyle(fontSize: 18, color: colorwhite),
                              ),
                            ],
                          ))
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
