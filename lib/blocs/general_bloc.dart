import "dart:async";
import 'package:mini_projeto/models/registos.dart';

import '../models/list_item.dart';

class general_bloc {
  final List<Registos> listItems = [
    Registos(100, true, 5),
    Registos(80, true, 3),
    Registos(70, false, 2),
    Registos(60, true, 1),
    Registos(86, true, 1),
    Registos(45, true, 1),
    Registos(70, false, 1),
    Registos(55, true, 2),
    Registos(60, true, 3),
    Registos(65, true, 4),
    Registos(60, true, 3),
    Registos(62, false, 3),
    Registos(70, true, 4),
    Registos(69, true, 5),
    Registos(68, false, 6),
    Registos(69, true, 5),
    Registos(69, true, 3),
    Registos(68, false, 2),
    Registos(65, true, 1),
    Registos(64, true, 2),
    Registos(62, false, 1),
    Registos(63, true, 2),
  ];

void orderList(){
  listItems.sort((a, b) {
    return a.dateTime.isAfter(b.dateTime) ? 0 : 1;
  });
}

List<Registos> registosLastXdays(DateTime start , DateTime end){

  List<Registos> lastXDays = [];

  for( Registos r in listItems ){
    if(r.dateTime.isAfter(start) && r.dateTime.isBefore(end)){
      lastXDays.add(r);
    }
  }
  return lastXDays;
}



double mediaPesoXdays(int days){

  final l = registosLastXdays(DateTime.now().subtract(Duration(days: days)), DateTime.now());

  double media = 0;

  for ( Registos x in l ){
    media += x.weight;
  }
  return media / l.length;
}






}

