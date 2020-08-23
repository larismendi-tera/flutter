import 'package:myapp/src/blocs/base_bloc.dart';
import 'package:myapp/src/models/like.dart';
import 'package:myapp/src/resources/firestore_provider.dart';
import 'package:myapp/src/ui/helpers/UiAction.dart';
import 'package:rxdart/rxdart.dart';

enum ACTIONS {
  showToast,
  error,
}

class LikeBloc extends BaseBloc {
  var _provider = FireStoreProvider();
  final _uiActions = BehaviorSubject<UiAction>();
  List<Like> _likes;
  List<Like> get likes => _likes;

  Observable<UiAction> get actions => _uiActions.stream;

  Future<void> createLikeBloc(Like like) async {
    _provider.createLike(like);
  }

  getLikesCount(String commentId) async {
    var likes = await _provider.getLikesCount(commentId);
    return likes;
  }

  // void listenToLikesRealTime() async {
  //   setLoading(true);
  //   _provider.listenToLikesRealTime().then((likes) {
  //     setLoading(false);
  //     _likes = likes;
  //   }).catchError((err) {
  //     setLoading(false);
  //     _uiActions.sink.add(new UiAction(
  //         action: ACTIONS.showToast.index, message: err.toString()));
  //   });
  // }

  void deleteLike(String documentId) async {
    _provider.deleteLike(documentId).then((like) {
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: 'Delete success'));
    }).catchError((err) {
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });
  }

  void dispose() {
    super.dispose();
    _uiActions.drain();
    _uiActions.close();
  }
}
