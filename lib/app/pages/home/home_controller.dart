import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_presenter.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_quotation_usecase.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  final FoxbitWebSocket ws;
  final FoxbitWebSocket quotationWS;
  List<InstrumentEntity> _instruments = [];
  List<AssetEntity> _assets = [];

  List<InstrumentEntity> get instruments => _instruments;
  List<AssetEntity> get assets => _assets;
  List<String> get instrumentsIds => _instruments.map((e) => e.instrumentId).toList();

  HomeController()
      : presenter = HomePresenter(),
        quotationWS = FoxbitWebSocket(),
        ws = FoxbitWebSocket() {
    ws.connect();
    quotationWS.connect();
    presenter.sendHeartbeat(ws);
    presenter.getInstruments(ws);
    presenter.getQuotations(GetQuotationUsecaseParams(_instruments, quotationWS));
  }

  //create homeController constructor
  // execute functions after setting ws = FoxbitWebSocket()

  @override
  void onDisposed() {
    ws.disconnect();
    quotationWS.disconnect();

    super.onDisposed();
  }

  @override
  void initListeners() {
    presenter.heartbeatOnComplete = heartbeatOnComplete;
    presenter.heartbeatOnError = heartbeatOnError;

    presenter.getInstrumentIdOnComplete = getInstrumentOnComplete;
    presenter.getInstrumentIdOnError = getInstrumentonError;
    presenter.getInstrumentIdOnNext = (List<InstrumentEntity> instruments) {
      return _instruments = instruments;
    };

    presenter.getQuotationsOnComplete = getQuotationOnComplete;
    presenter.getQuotationsOnError = getQuotationOnError;
    presenter.getQuotationsOnNext = (List<AssetEntity> assets) {
      return _assets = assets;
    };
  }

  void heartbeatOnComplete() {
    _scheduleNextHeartbeat();
  }

  void getInstrumentOnComplete() {
    _scheduleNextInstrumentId();
    refreshUI();
  }

  void getQuotationOnComplete() {
    _scheduleNextQuotation();
    refreshUI();
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

  void getQuotationOnError(dynamic e) {
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
    Timer(const Duration(seconds: 10), () {
      presenter.getInstruments(ws);
    });
  }

  void _scheduleNextQuotation() {
    Timer(const Duration(seconds: 30), () {
      presenter.getQuotations(GetQuotationUsecaseParams(_instruments, ws));
    });
  }
}
