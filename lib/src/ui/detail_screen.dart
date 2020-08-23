import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/comments_screen.dart';
import 'package:myapp/src/ui/widgets/button_purple.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(
      {Key key,
      this.data,
      this.uid,
      this.image,
      this.title,
      this.autor,
      this.likes,
      this.days,
      this.description,
      this.imageProfile});
  final Object data;
  final String uid;
  final String image;
  final String title;
  final String autor;
  final String description;
  final String imageProfile;
  final int likes;
  final String days;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CommentsScreen()));
          },
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
                            image: NetworkImage(image), fit: BoxFit.cover)),
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
                            title,
                            style: TextStyle(
                                color: kBackgroudColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            autor,
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
                    description,
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
                        backgroundImage: NetworkImage(imageProfile),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            autor,
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
                  SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ));
  }
}
