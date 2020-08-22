import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' show Client;
// import 'dart:convert';
import '../models/event.dart';

class EventProvider {
  // Client client = Client();
  // final _apiKey = 'your_api_key';

  Future<Event> fetchEventList() async {
    print("entered");
    return Event.fromMap(Firestore.instance.collection('baby').snapshots());

    // final response = await client
    //   .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    // print(response.body.toString());
    // if (response.statusCode == 200) {
    //   // If the call to the server was successful, parse the JSON
    //   return Event.fromJson(json.decode(response.body));
    // } else {
    //   // If that call was not successful, throw an error.
    //   throw Exception('Failed to load post');
    // }
  }
}
