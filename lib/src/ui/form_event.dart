import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/blocs/event_bloc.dart';
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
  final title = TextEditingController();
  final location = TextEditingController();
  final date = TextEditingController();
  final description = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    title.dispose();
    location.dispose();
    date.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.all(kDefaultPadding),
            color: kBackgroudAltColor,
            child: Column(
              children: [
                Text(
                  "Agregar Evento",
                  style: TextStyle(color: kPrimaryColor),
                ),
                Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  width: size.width,
                  height: 1,
                  color: kPrimaryColor.withAlpha(150),
                ),
                Container(
                  width: size.width * .8,
                  height: size.width * .6,
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: kBackgroudAltColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(kDefaultPadding * .3),
                        width: size.width * .3,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Text("Agregar Imagen"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextInput(
                  label: "Titulo",
                  controller: title,
                  inputType: null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "Lugar",
                  controller: location,
                  inputType: TextInputType.streetAddress,
                  maxLine: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "Fecha",
                  controller: date,
                  inputType: null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInput(
                  label: "Descripción",
                  controller: description,
                  inputType: TextInputType.multiline,
                  maxLine: 5,
                ),
                ButtonPurple(
                    onPress: () {
                      EventBloc().createEventBloc(Event(
                          title: title.text,
                          description: description.text,
                          date: date.text,
                          location: location.text));
                    },
                    title: "Guardar")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
