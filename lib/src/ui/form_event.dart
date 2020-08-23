import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/blocs/event_bloc.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/widgets/button_purple.dart';
import 'package:myapp/src/ui/widgets/text_input.dart';
import 'package:image_picker/image_picker.dart';

class FormEvent extends StatefulWidget {
  @override
  _FormEventState createState() => _FormEventState();
}

class _FormEventState extends State<FormEvent> {
  File _image;
  final picker = ImagePicker();
  List<ImageSource> imageSourceList = [ImageSource.gallery, ImageSource.camera];
  //FormEvent({Key key});

  Future getImage(int type) async {
    final pickedFile = await picker.getImage(source: imageSourceList[type]);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      }
    });
  }

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
    setState(() {
      _image = null;
      title.clear();
      location.clear();
      date.clear();
      description.clear();
    });
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Container(
                        width: size.width * .8,
                        height: size.width * .6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: _image == null
                            ? Image.asset(
                                'assets/images/plus.png',
                              )
                            : Image.file(
                                _image,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Container(
                        width: size.width * .8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              key: null,
                              onTap: () => getImage(1),
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.all(kDefaultPadding * .3),
                                width: size.width * .3,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Text("Camara"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * .8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              key: null,
                              onTap: () => getImage(0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(kDefaultPadding * .3),
                                width: size.width * .3,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Text("Galeria"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextInput(
                  label: "Titulo",
                  controller: title,
                  inputType: null,
                  maxLine: 1,
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
                  maxLine: 1,
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
                      EventBloc().createEventBloc(
                          Event(
                              title: title.text,
                              description: description.text,
                              date: date.text,
                              location: location.text),
                          _image);
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
