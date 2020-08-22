import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/widgets/button_purple.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String dummyText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lobortis vulputate interdum. Fusce molestie urna id mi scelerisque bibendum in eget eros. Curabitur tincidunt consequat nisl quis mattis. Sed justo mi, euismod in luctus vel, ullamcorper in mauris. Aenean at mi sit amet quam pellentesque rutrum. Fusce euismod augue quam, scelerisque semper dolor vestibulum a. Sed egestas felis leo, a rhoncus ipsum cursus sit amet. Nulla interdum eu ligula at fermentum. Phasellus vehicula tincidunt purus non luctus.";
    final String dummyText2 =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lobortis vulputate interdum.";
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.message,
            color: kBackgroudAltColor,
          ),
          backgroundColor: kPrimaryColor,
        ),
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
              color: kBackgroudAltColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
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
                            margin: EdgeInsets.symmetric(
                                vertical: kDefaultPadding * .5),
                            height: 2,
                            width: size.width * .5,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                      Spacer(),
                      ButtonPurple(
                        title: "asistire",
                        onPress: () {},
                        width: 100.0,
                      ),
                    ],
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
                        backgroundImage:
                            AssetImage("assets/images/persona1.jpg"),
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
                  SizedBox(height: 20),
                  Text(
                    'Comentarios:',
                    style: TextStyle(
                        color: kBackgroudColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: kPrimaryColor,
                            backgroundImage:
                                AssetImage("assets/images/persona2.jpg"),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Chu-li-to',
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
                          ),
                          Spacer(),
                          Icon(
                            Icons.thumb_up,
                            color: kTextColor,
                            size: 30,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: size.width,
                        child: Text(
                          dummyText,
                          style: TextStyle(
                              color: kBackgroudColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: kDefaultPadding * .5),
                        height: 1,
                        width: size.width,
                        color: kBorderColor.withAlpha(100),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
