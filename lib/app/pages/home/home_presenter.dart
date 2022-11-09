import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/data/repositories/heartbeat_repository.dart';
import 'package:foxbit_hiring_test_template/data/repositories/instrument_repository.dart';
import 'package:foxbit_hiring_test_template/data/repositories/quotation_repository.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_instrument_id_usecase.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_quotation_usecase.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/heartbeat_usecase.dart';

class HomePresenter extends Presenter {
  Function heartbeatOnComplete;
  Function(dynamic) heartbeatOnError;

  Function getInstrumentIdOnComplete;
  Function getInstrumentIdOnNext;
  Function(dynamic) getInstrumentIdOnError;

  Function getQuotationsOnComplete;
  Function getQuotationsOnNext;
  Function(dynamic) getQuotationsOnError;

  final HeartbeatUseCase _heartbeatUseCase = HeartbeatUseCase(HeartbeatRepository());
  final GetInstrumentIdUsecase _getInstrumentIdUseCase =
      GetInstrumentIdUsecase(InstrumentRepository());

  final GetQuotationUsecase _getQuotationUsecase = GetQuotationUsecase(QuotationRepository());

  void sendHeartbeat(FoxbitWebSocket ws) {
    _heartbeatUseCase.execute(_HeartBeatObserver(this), ws);
  }

  void getInstruments(FoxbitWebSocket ws) {
    _getInstrumentIdUseCase.execute(_InstrumentIdObserver(this), ws);
  }

  void getQuotations(GetQuotationUsecaseParams params) {
    _getQuotationUsecase.execute(_QuotationObserver(this), params);
  }

  @override
  void dispose() {
    _heartbeatUseCase.dispose();
    _getInstrumentIdUseCase.dispose();
    _getQuotationUsecase.dispose();
  }
}

class _HeartBeatObserver implements Observer<void> {
  HomePresenter presenter;

  _HeartBeatObserver(this.presenter);

  @override
  void onNext(_) {}

  @override
  void onComplete() {
    assert(presenter.heartbeatOnComplete != null);
    presenter.heartbeatOnComplete();
  }

  @override
  void onError(dynamic e) {
    assert(presenter.heartbeatOnError != null);
    presenter.heartbeatOnError(e);
  }
}

class _InstrumentIdObserver implements Observer<List<InstrumentEntity>> {
  HomePresenter presenter;

  _InstrumentIdObserver(this.presenter);

  @override
  void onNext(List<InstrumentEntity> data) {
    assert(data is List<InstrumentEntity>);
    assert(presenter.getInstrumentIdOnComplete != null);
    presenter.getInstrumentIdOnNext(data);
  }

  @override
  void onComplete() {
    assert(presenter.getInstrumentIdOnComplete != null);
    presenter.getInstrumentIdOnComplete();
  }

  @override
  void onError(dynamic e) {
    assert(presenter.getInstrumentIdOnError != null);
    presenter.getInstrumentIdOnError(e);
  }
}

class _QuotationObserver implements Observer<List<AssetEntity>> {
  HomePresenter presenter;

  _QuotationObserver(this.presenter);

  @override
  void onNext(List<AssetEntity> data) {
    assert(data is List<AssetEntity>);
    assert(presenter.getInstrumentIdOnComplete != null);
    presenter.getQuotationsOnNext(data);
  }

  @override
  void onComplete() {
    assert(presenter.getInstrumentIdOnComplete != null);
    presenter.getQuotationsOnComplete();
  }

  @override
  void onError(dynamic e) {
    assert(presenter.getInstrumentIdOnError != null);
    presenter.getQuotationsOnError(e);
  }
}
