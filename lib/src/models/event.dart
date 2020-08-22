// import firestore

class Event {
  int _page;
  int _total_results;
  int _total_pages;
  List<_Result> _results = [];

  Event.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  Event.fromMap();

  List<_Result> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

// class _Record {
//   final String name;
//   final int votes;
//   final DocumentReference reference;

//   Record.fromMap(Map<String, dynamic> map, {this.reference})
//       : assert(map['name'] != null),
//         assert(map['votes'] != null),
//         name = map['name'],
//         votes = map['votes'];

//   Record.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data, reference: snapshot.reference);

//   @override
//   String toString() => "Record<$name:$votes>";
// }

class _Result {
  final int id;
  final String name;
  final String email;
  final String password;
  final String fotoUrl;
  final DateTime birthday;
  final DateTime createdAt;
  final DateTime updatedAt;

  _Result(result) {
    id = result['id'];
    name = result['name'];
    email = result['email'];
    fotoUrl = result['fotoUrl'];
    password = result['password'];
    birthday = result['birthday'];
    createdAt = result['created_at'];
    updatedAt = result['updated_at'];
    // for (int i = 0; i < result['genre_ids'].length; i++) {
    //   _genre_ids.add(result['genre_ids'][i]);
    // }
  }

  // int get id => id;
  // String get name => _name;
  // String get email => _email;
  // String get fotoUrl => _fotoUrl;
  // String get password => _password;
  // String get birthday => _birthday;
  // DateTime get createdAt => _createdAt;
  // DateTime get updatedAt => _updatedAt;
}
