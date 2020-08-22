import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({Key key, this.title, this.buttonText});
  final String title;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding * .5),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          Spacer(),
          FlatButton(
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
