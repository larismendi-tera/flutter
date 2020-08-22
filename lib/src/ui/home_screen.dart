import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(right: 10, bottom: kDefaultPadding),
                      //color: Colors.white,
                      width: size.width,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Positioned(
                      left: kDefaultPadding,
                      top: size.height * .02,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Titulo ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: kDefaultPadding),
                          Text(
                            "Nombre Persona",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w100),
                          ),
                          SizedBox(height: kDefaultPadding),
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Colors.black,
                                size: 30,
                              ),
                              Text(
                                "21",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: new CircleAvatar(
                        radius: 40.0,
                        backgroundColor: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(right: 10, bottom: kDefaultPadding),
                      //color: Colors.white,
                      width: size.width,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Positioned(
                      left: kDefaultPadding,
                      top: size.height * .02,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hola mundo",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Nombre Persona",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: new CircleAvatar(
                        radius: 40.0,
                        backgroundColor: kPrimaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
