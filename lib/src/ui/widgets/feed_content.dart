import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/blocs/event_bloc.dart';
import 'package:myapp/src/ui/comments_screen.dart';

class FeedContent extends StatefulWidget {
  @override
  _FeedContentState createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> {
  List<FeedContentChild> events = new List<FeedContentChild>();
  EventBloc eventBloc = new EventBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  void init() async {
    var event = await eventBloc.getEventsList();
    setState(() {
      if (event != null) {
        event.forEach((element) {
          events.add(FeedContentChild(
              uid: jsonDecode(element.creator)["uid"],
              data: element,
              image: element.photoUrl,
              title: element.title,
              description: element.description,
              autor: jsonDecode(element.creator)["displayName"],
              imageProfile: jsonDecode(element.creator)["photoUrl"],
              likes: 10,
              days: element.date));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: events,
      ),
    );
  }
}

class FeedContentChild extends StatelessWidget {
  const FeedContentChild({
    Key key,
    this.uid,
    this.data,
    this.image,
    this.title,
    this.autor,
    this.description,
    this.imageProfile,
    this.likes,
    this.days,
  }) : super(key: key);
  final String uid;
  final Object data;
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
    return Stack(
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
                Image.network(
                  image,
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
                  backgroundImage: NetworkImage(imageProfile),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text(
                  autor,
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
                      autor,
                      style: TextStyle(color: kPrimaryColor, fontSize: 15),
                    ),
                    Text(
                      "Descripcion",
                      style: TextStyle(color: kPrimaryColor, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CommentsScreen()));
                  },
                  child: Icon(
                    Icons.comment,
                    color: kPrimaryColor,
                  ),
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
    );
  }
}
