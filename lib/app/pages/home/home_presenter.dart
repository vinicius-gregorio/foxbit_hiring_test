import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/data/repositories/heartbeat_repository.dart';
import 'package:foxbit_hiring_test_template/data/repositories/instrument_repository.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_instrument_id_usecase.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/heartbeat_usecase.dart';

class HomePresenter extends Presenter {
  Function heartbeatOnComplete;
  Function(dynamic) heartbeatOnError;

  Function getInstrumentIdOnComplete;
  Function(dynamic) getInstrumentIdOnError;

  final HeartbeatUseCase _heartbeatUseCase = HeartbeatUseCase(HeartbeatRepository());
  final GetInstrumentIdUsecase _getInstrumentIdUseCase =
      GetInstrumentIdUsecase(InstrumentRepository());

  void sendHeartbeat(FoxbitWebSocket ws) {
    _heartbeatUseCase.execute(_HeartBeatObserver(this), ws);
  }

  void getInstruments(FoxbitWebSocket ws) {
    _getInstrumentIdUseCase.execute(_InstrumentIdObserver(this), ws);
  }

  @override
  void dispose() {
    _heartbeatUseCase.dispose();
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

class _InstrumentIdObserver implements Observer<void> {
  HomePresenter presenter;

  _InstrumentIdObserver(this.presenter);

  @override
  void onNext(_) {}

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
