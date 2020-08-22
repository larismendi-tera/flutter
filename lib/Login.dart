import 'package:flutter/material.dart';
import 'constants.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          width: size.width,
          height: size.height,
          color: kBackgroudColor,
        ),
        Column(
          children: [
            Center(
              child: Image.asset("assets/images/logoTeraton.png"),
            )
          ],
        ),
      ]),
    );
  }
}
