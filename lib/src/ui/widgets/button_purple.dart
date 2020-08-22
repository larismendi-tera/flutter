import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class ButtonPurple extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double width;
  final double height;
  ButtonPurple(
      {Key key,
      @required this.title,
      @required this.onPress,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
            top: 30.0, left: 20.0, right: 20.0, bottom: kDefaultPadding * 2),
        height: 45,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0), color: kPrimaryColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
