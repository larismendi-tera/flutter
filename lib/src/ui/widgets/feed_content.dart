import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class FeedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding),
              width: size.width,
              height: size.width,
              color: kPrimaryColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/game.jpg",
                      width: size.width,
                      height: size.width,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: kBackgroudAltColor.withAlpha(180),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      backgroundImage: AssetImage("assets/images/persona1.jpg"),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Karen",
                      style: TextStyle(color: kPrimaryColor, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: kDefaultPadding,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(kDefaultPadding * .5),
                color: kBackgroudAltColor.withAlpha(180),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Karen",
                          style: TextStyle(color: kPrimaryColor, fontSize: 15),
                        ),
                        Text(
                          "Descripcion",
                          style: TextStyle(color: kPrimaryColor, fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.comment,
                      color: kPrimaryColor,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.favorite,
                      color: kPrimaryColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
