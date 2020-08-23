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
  final File image;
  FormEvent({Key key, this.image});

  @override
  _FormEventState createState() => _FormEventState();
}

class _FormEventState extends State<FormEvent> {
  @override
  Widget build(BuildContext context) {
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
                  controller: null,
                  inputType: null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "Lugar",
                  controller: null,
                  inputType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "Fecha",
                  controller: null,
                  inputType: null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "Descripción",
                  controller: null,
                  inputType: TextInputType.multiline,
                  maxLine: 5,
                ),
                ButtonPurple(onPress: () {}, title: "Guardar")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
