import 'package:flutter/material.dart';
// import '../models/user_model.dart';
// import '../blocs/users_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de usuarios'),
      ),
      // body: StreamBuilder(
      //   stream: bloc.allMovies,
      //   builder: (context, AsyncSnapshot<UserModel> snapshot) {
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

//   Widget buildList(AsyncSnapshot<UserModel> snapshot) {
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
