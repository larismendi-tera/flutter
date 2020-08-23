import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String dummyText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lobortis vulputate interdum. Fusce molestie urna id mi scelerisque bibendum in eget eros. Curabitur tincidunt consequat nisl quis mattis. Sed justo mi, euismod in luctus vel, ullamcorper in mauris. Aenean at mi sit amet quam pellentesque rutrum. Fusce euismod augue quam, scelerisque semper dolor vestibulum a. Sed egestas felis leo, a rhoncus ipsum cursus sit amet. Nulla interdum eu ligula at fermentum. Phasellus vehicula tincidunt purus non luctus.";
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: kPrimaryColor,
              backgroundImage: AssetImage("assets/images/persona2.jpg"),
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
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding * .5),
          height: 1,
          width: size.width,
          color: kBorderColor.withAlpha(100),
        ),
      ],
    );
  }
}
