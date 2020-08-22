import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/user_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<UserModel>();

  Observable<UserModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    UserModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
