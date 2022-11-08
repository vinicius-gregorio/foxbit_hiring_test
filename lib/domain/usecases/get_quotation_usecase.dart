import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/quotation_repository.dart';

class GetQuotationUsecase extends CompletableUseCase<FoxbitWebSocket> {
  GetQuotationUsecase(this._repository, this.params);

  final IQuotationRepository _repository;
  final GetSubscribeLevelUsecaseParams params;
  @override
  Future<Stream<List<InstrumentEntity>>> buildUseCaseStream(FoxbitWebSocket params) async {
    final StreamController<List<InstrumentEntity>> controller =
        StreamController<List<InstrumentEntity>>();

    // try {
    //   final List<InstrumentEntity> instruments = await _repository.getSubscribeLevel(params);
    //   controller.add(instruments);
    //   controller.close();
    // } catch (e) {
    //   controller.addError(e);
    // }

    // return controller.stream;
  }
}

class GetSubscribeLevelUsecaseParams {
  final String instrumentId;

  GetSubscribeLevelUsecaseParams(this.instrumentId);
}