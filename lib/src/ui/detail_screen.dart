import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String dummyText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lobortis vulputate interdum. Fusce molestie urna id mi scelerisque bibendum in eget eros. Curabitur tincidunt consequat nisl quis mattis. Sed justo mi, euismod in luctus vel, ullamcorper in mauris. Aenean at mi sit amet quam pellentesque rutrum. Fusce euismod augue quam, scelerisque semper dolor vestibulum a. Sed egestas felis leo, a rhoncus ipsum cursus sit amet. Nulla interdum eu ligula at fermentum. Phasellus vehicula tincidunt purus non luctus.";
    return Scaffold(
        body: ListView(
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.width * .7,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    image: DecorationImage(
                        image: AssetImage("assets/images/oficina.jpg"),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          width: size.width,
          height: size.height,
          color: kBackgroudAltColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(
                    color: kBackgroudColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Nombre persona',
                style: TextStyle(
                    color: kBackgroudColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
                height: 2,
                width: size.width * .5,
                color: kPrimaryColor,
              ),
              Text(
                'Description:',
                style: TextStyle(
                    color: kBackgroudColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                dummyText,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: kBackgroudColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: kPrimaryColor,
                    backgroundImage: AssetImage("assets/images/persona1.jpg"),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre persona',
                        style: TextStyle(
                            color: kBackgroudColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'RRHH',
                        style: TextStyle(
                            color: kBackgroudColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
                height: 2,
                width: size.width * .6,
                color: kPrimaryColor,
              ),
              Text(
                'Comentarios:',
                style: TextStyle(
                    color: kBackgroudColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
