import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/instrument_repository.dart';

class GetInstrumentIdUsecase extends CompletableUseCase<FoxbitWebSocket> {
  GetInstrumentIdUsecase(this._repository);

  final IInstrumentRepository _repository;

  @override
  Future<Stream<void>> buildUseCaseStream(FoxbitWebSocket params) async {
    final StreamController<void> controller = StreamController<void>();

    try {
      final Map _ = await _repository.getInstrumentId(params);

      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}
