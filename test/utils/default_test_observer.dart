import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DefaultTestObserver implements Observer<dynamic> {
  bool ended = false;
  bool done = false;
  bool error = false;
  dynamic data;
  Exception exception;

  @override
  void onNext(dynamic data) {
    this.data = data;
  }

  @override
  void onComplete() {
    done = true;
    ended = true;
  }

  @override
  void onError(dynamic e) {
    exception = e as Exception;
    done = false;
    error = true;
    ended = true;
  }
}
