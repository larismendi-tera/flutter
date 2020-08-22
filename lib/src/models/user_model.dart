class UserModel {
  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];

  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get totalPages => _totalPages;
  int get totalResults => _totalResults;
  int get page => _page;
}

class _Result {
  int _id;
  String _name;
  String _email;
  String _password;
  String _fotoUrl;
  String _birthday;
  DateTime _createdAt;
  DateTime _updatedAt;

  _Result(result) {
    _id = result['id'];
    _name = result['name'];
    _email = result['email'];
    _fotoUrl = result['fotoUrl'];
    _password = result['password'];
    _birthday = result['birthday'];
    _createdAt = result['created_at'];
    _updatedAt = result['updated_at'];
    // for (int i = 0; i < result['genre_ids'].length; i++) {
    //   _genre_ids.add(result['genre_ids'][i]);
    // }
  }

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get fotoUrl => _fotoUrl;
  String get password => _password;
  String get birthday => _birthday;
  DateTime get createdAt => _createdAt;
  DateTime get updatedAt => _updatedAt;
}
