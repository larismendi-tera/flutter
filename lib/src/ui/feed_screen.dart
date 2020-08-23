// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/models/event.dart';
import 'package:myapp/src/blocs/events_bloc.dart';
import 'package:myapp/src/ui/widgets/card_people.dart';
import 'package:myapp/src/ui/widgets/feed_content.dart';
import 'package:myapp/src/ui/widgets/header_slider.dart';
import 'package:myapp/src/ui/widgets/section_title.dart';

class FeedScreen extends StatelessWidget {
  // EventsBloc _bloc;

  // void createEventInfo(Event event) async {
  //   log('async ----');
  //   _bloc.createEventBloc(event);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => EventsBloc().createEventBloc(Event(
            title: 'Testing',
            description: 'Description',
            date: '8/22/2020',
            location: 'Localization')),
        child: Icon(Icons.add, color: kBackgroudAltColor),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: kDefaultPadding * 3),
          children: [
            SectionTitle(title: "Proximos Eventos", buttonText: "ver mas"),
            HeaderSlider(),
            SectionTitle(title: "Proximos Cumpleaños", buttonText: "ver mas"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardPeople(
                      image: "assets/images/persona1.jpg",
                      name: "karen",
                      date: "Sep 7"),
                  CardPeople(
                      image: "assets/images/persona2.jpg",
                      name: "Chu-li",
                      date: "Oct 10"),
                  CardPeople(
                      image: "assets/images/persona3.jpg",
                      name: "Kate",
                      date: "Nov 15"),
                ],
              ),
            ),
            SectionTitle(title: "Feed", buttonText: ""),
            FeedContent(),
          ],
        ),
      ),
    );
  }
}
