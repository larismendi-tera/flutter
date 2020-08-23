import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/ui/form_event.dart';
import 'package:myapp/src/ui/widgets/content_pepole.dart';
import 'package:myapp/src/ui/widgets/feed_content.dart';
import 'package:myapp/src/ui/widgets/header_slider.dart';
import 'package:myapp/src/ui/widgets/section_title.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //onPressed: () => UserBloc().getUsersList(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => FormEvent()));
        },
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
            ContentPeople(),
            SectionTitle(title: "Feed", buttonText: ""),
            FeedContent(),
          ],
        ),
      ),
    );
  }
}
