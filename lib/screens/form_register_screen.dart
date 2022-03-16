import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_projeto/blocs/general_bloc.dart';
import 'package:mini_projeto/models/registos.dart';
import 'package:mini_projeto/screens/list_screen.dart';
import '../blocs/general_bloc.dart';
import '../widgets/DropdownWidget.dart';
import '../widgets/checkBoxWidget.dart';

class FormScreen extends StatefulWidget {
  general_bloc bloc;

  FormScreen(this.bloc, {Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late double weight;
  bool recentMeal3h = false;
  late int feelAval = 1;
  late String Obs;

  final colorstheme = Color(0xff0d0432);
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  final dropdownList = <int>[1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Novo Registo",
              style: TextStyle(
                  fontSize: 27,
                  color: colorstheme,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          shadowColor: Colors.blue,
        ),
        key: _scaffoldKey,
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                /*Text("Novo Registo",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    )),*/
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (String? value) {
                    weight = double.parse(value ?? "");
                  },
                  decoration: InputDecoration(
                      labelText: "Insira o seu peso em Kg", hintText: "Ex: 45"),
                  validator: (value) {
                    if (value!.isEmpty || double.tryParse(value) == null) {
                      return "Insira um peso válido";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(children: [
                  const Text(
                    "Como se sente Hoje? (1 a 5)",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 102, 102, 102)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: DropdownButton(
                      value: feelAval,
                      items: dropdownList
                          .map((e) => DropdownMenuItem(
                              value: e, child: Text(e.toString())))
                          .toList(),
                      onChanged: (int? val) {
                        setState(() {
                          if (val != null) feelAval = val;
                          print(feelAval);
                        });
                      },
                    ),
                  ),
                ]),
                //DropDownWidget(),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(children: [
                  const Text(
                    "Comeu nas últimas 3 horas ?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 100, 100, 100)),
                  ),
                  Container(
                    child: Checkbox(
                      value: recentMeal3h,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        setState(() {
                          if (val != null) recentMeal3h = val;
                          print(recentMeal3h);
                        });
                      },
                    ),
                  ),
                ]),
                //CheckBoxWidget(),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  onSaved: (String? value) {
                    Obs = value ?? "";
                  },
                  decoration: const InputDecoration(
                    labelText: "Observações",
                    hintText: "Min: 100 caracteres | Max: 200 caracteres",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return null;
                    } else if (value.length < 100 || value.length > 200) {
                      return "Insira uma descrição com no min 100 caracteres e no máximo 200";
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          minimumSize: const Size.fromHeight(50)),
                      label: Text("Submeter"),
                      icon: Icon(Icons.subdirectory_arrow_right),
                      onPressed: () {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Registos novoRegisto = Registos(
                              weight, recentMeal3h, feelAval,
                              Obs: Obs);
                          widget.bloc.listItems.add(novoRegisto);
                          print(widget.bloc.listItems.toString());
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  content: Text(
                                      "O seu registo foi submetido com sucesso!!!"),
                                );
                              });
                        }
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
