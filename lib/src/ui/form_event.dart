import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/widgets/button_purple.dart';
import 'package:myapp/src/ui/widgets/text_input.dart';
/*titulo,
descripcion,
lugar,
fecha*/

class FormEvent extends StatefulWidget {
  File image;
  FormEvent({Key key, this.image});

  @override
  _FormEventState createState() => _FormEventState();
}

class _FormEventState extends State<FormEvent> {
  @override
  Widget build(BuildContext context) {
    final _controllerTitleEvent = TextEditingController();
    final _controllerLocationEvent = TextEditingController();
    final _controllerDateEvent = TextEditingController();
    final _controllerDescriptionEvent = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.all(kDefaultPadding),
            color: kBackgroudAltColor,
            child: Column(
              children: [
                Text(
                  "Agregar Evento:",
                  style: TextStyle(color: kPrimaryColor),
                ),
                Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  width: size.width,
                  height: 1,
                  color: kPrimaryColor.withAlpha(150),
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "Titulo",
                  controller: _controllerTitleEvent,
                  inputType: TextInputType.name,
                  maxLine: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "Lugar",
                  controller: _controllerLocationEvent,
                  inputType: TextInputType.streetAddress,
                  maxLine: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "fecha",
                  controller: _controllerDateEvent,
                  inputType: TextInputType.datetime,
                  maxLine: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "descripcion",
                  controller: _controllerDescriptionEvent,
                  inputType: TextInputType.multiline,
                  maxLine: 5,
                ),
                ButtonPurple(title: "Guardar")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
