// import 'dart:io';

import 'package:myapp/src/blocs/base_bloc.dart';
import 'package:myapp/src/models/comment.dart';
import 'package:myapp/src/resources/firestore_provider.dart';
import 'package:myapp/src/ui/helpers/UiAction.dart';
import 'package:rxdart/rxdart.dart';

enum ACTIONS {
  showToast,
  error,
}

class CommentBloc extends BaseBloc {
  var _provider = FireStoreProvider();
  final _uiActions = BehaviorSubject<UiAction>();
  List<Comment> _comments;
  List<Comment> get comments => _comments;

  Observable<UiAction> get actions => _uiActions.stream;

  Future<void> createCommentBloc(Comment comment) async {
    _provider.createComment(comment);
  }

  getCommentsList(String eventId) async {
    var comments = await _provider.getCommentList(eventId);
    return comments;
  }

  void listenToCommentsRealTime() async {
    setLoading(true);
    _provider.listenToCommentsRealTime().then((comments) {
      setLoading(false);
      _comments = comments;
    }).catchError((err) {
      setLoading(false);
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });
  }

  void deleteComment(String documentId) async {
    _provider.deleteComment(documentId).then((comment) {
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: 'Delete success'));
    }).catchError((err) {
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: err.toString()));
    });
  }

  void updateComment(Comment comment) async {
    _provider.updateComment(comment).then((comment) {
      _uiActions.sink.add(new UiAction(
          action: ACTIONS.showToast.index, message: 'Update success'));
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
