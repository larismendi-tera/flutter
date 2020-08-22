import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/widgets/card_people.dart';
import 'package:myapp/src/ui/widgets/feed_content.dart';
import 'package:myapp/src/ui/widgets/header_slider.dart';
import 'package:myapp/src/ui/widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
            FeedContent(),
          ],
        ),
      ),
    );
  }
}
