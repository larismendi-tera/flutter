import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/src/blocs/user_bloc.dart';

import 'card_people.dart';

class ContentPeople extends StatefulWidget {
  @override
  _ContentPeopleState createState() => _ContentPeopleState();
}

class _ContentPeopleState extends State<ContentPeople> {
  List<CardPeople> usersList = new List<CardPeople>();
  UserBloc userBloc = new UserBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  void init() async {
    var users = await userBloc.getUsersList();
    setState(() {
      if (users != null) {
        users.forEach((element) {
          usersList.add(CardPeople(
              image: element.avatar, name: element.fullName, date: "Sep 7"));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: usersList,
      ),
    );
  }
}
