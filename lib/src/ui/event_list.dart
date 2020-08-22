import 'package:flutter/material.dart';
// import '../models/event.dart';
// import '../blocs/events_bloc.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bloc.fetchAllEvents();
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      // body: StreamBuilder(
      //   stream: bloc.allEvents,
      //   builder: (context, AsyncSnapshot<Event> snapshot) {
      //     if (snapshot.hasData) {
      //       return buildList(snapshot);
      //     } else if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),
    );
  }

//   Widget buildList(AsyncSnapshot<Event> snapshot) {
//     return GridView.builder(
//         itemCount: snapshot.data.results.length,
//         gridDelegate:
//             new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return Image.network(
//             'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
//             fit: BoxFit.cover,
//           );
//         });
//   }
}
