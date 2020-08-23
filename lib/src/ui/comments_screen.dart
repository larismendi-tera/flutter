import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/widgets/comment.dart';
import 'package:myapp/src/ui/widgets/text_input.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final comentario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            color: kBackgroudAltColor,
            child: ListView(
              children: [Comment(), Comment()],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: kBackgroudAltColor,
                  width: size.width,
                  padding: EdgeInsets.only(bottom: kDefaultPadding * .5),
                  child: TextInput(
                    label: "",
                    controller: comentario,
                    inputType: TextInputType.name,
                    maxLine: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
