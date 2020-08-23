import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/blocs/event_bloc.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/widgets/button_purple.dart';
import 'package:myapp/src/ui/widgets/text_input.dart';

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

  clearTextInput() {
    title.clear();
    location.clear();
    date.clear();
    description.clear();
  }

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
                  "Agregar Evento",
                  style: TextStyle(color: kPrimaryColor),
                ),
                Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  width: size.width,
                  height: 1,
                  color: kPrimaryColor.withAlpha(150),
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
                      clearTextInput();
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
