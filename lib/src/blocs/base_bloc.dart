import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BaseBloc extends ChangeNotifier {
  final _loading = BehaviorSubject<bool>();

  Observable<bool> get loadingObservable => _loading.stream;

  void setLoading(bool loading) {
    _loading.sink.add(loading);
  }

  // ignore: must_call_super
  void dispose() async {
    await _loading.drain();
    _loading.close();
  }
}
