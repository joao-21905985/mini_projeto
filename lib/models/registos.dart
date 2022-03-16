import 'package:intl/intl.dart';

class Registos {

  double weight;
  bool recentMeal3h;
  int feelAval;
  String Obs;

  DateTime dateTime = DateTime.now();

  Registos(this.weight,this.recentMeal3h,this.feelAval, {this.Obs =""});

  String getDate() {
    return DateFormat("dd-MM-yyyy").format(dateTime);
  }


  @override
  String toString(){
    return "Registado no dia ${getDate()} com um peso de:$weight kg e uma avaliação de: $feelAval";
  }

}