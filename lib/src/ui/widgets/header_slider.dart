import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:myapp/src/blocs/event_bloc.dart';
import 'package:myapp/src/ui/widgets/home_slide_item.dart';

class HeaderSlider extends StatefulWidget {
  @override
  _HeaderSliderState createState() => _HeaderSliderState();
}

class _HeaderSliderState extends State<HeaderSlider> {
  List<HomeSlideItem> events = new List<HomeSlideItem>();
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
          events.add(HomeSlideItem(
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
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: events,
          ),
        )
      ],
    );
  }
}
