import 'package:flutter/material.dart';
import 'ui/event_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData.dark(),
      home: EventList(),
    );
  }
}
