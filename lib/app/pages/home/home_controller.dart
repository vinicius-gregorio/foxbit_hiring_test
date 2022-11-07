import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_presenter.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  final FoxbitWebSocket ws;

  HomeController()
      : presenter = HomePresenter(),
        ws = FoxbitWebSocket() {
    ws.connect();
    presenter.sendHeartbeat(ws);
    presenter.getInstruments(ws);
  }

  @override
  void onDisposed() {
    ws.disconnect();

    super.onDisposed();
  }

  @override
  void initListeners() {
    presenter.heartbeatOnComplete = heartbeatOnComplete;
    presenter.heartbeatOnError = heartbeatOnError;
    presenter.getInstrumentIdOnComplete = getInstrumentOnComplete;
    presenter.getInstrumentIdOnError = getInstrumentonError;
  }

  void heartbeatOnComplete() {
    _scheduleNextHeartbeat();
  }

  void getInstrumentOnComplete() {
    _scheduleNextInstrumentId();
  }

  void heartbeatOnError(dynamic e) {
    // (getStateKey().currentState as ScaffoldState).showSnackBar(
    //   const SnackBar(
    //     duration: Duration(seconds: 10),
    //     content: Text('Não foi possível enviar a mensagem: [PING]')
    //   )
    // );

    _scheduleNextHeartbeat();
  }

  void getInstrumentonError(dynamic e) {
    // (getStateKey().currentState as ScaffoldState).showSnackBar(
    //   const SnackBar(
    //     duration: Duration(seconds: 10),
    //     content: Text('Não foi possível enviar a mensagem: [PING]')
    //   )
    // );

    _scheduleNextHeartbeat();
  }

  void _scheduleNextHeartbeat() {
    Timer(const Duration(seconds: 30), () {
      presenter.sendHeartbeat(ws);
    });
  }

  void _scheduleNextInstrumentId() {
    Timer(const Duration(seconds: 15), () {
      presenter.getInstruments(ws);
    });
  }
}
