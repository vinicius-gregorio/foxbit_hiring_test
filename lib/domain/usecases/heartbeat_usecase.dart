import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/heartbeat_repository.dart';

class HeartbeatUseCase extends CompletableUseCase<FoxbitWebSocket> {
  HeartbeatUseCase(this._repository);

  final IHeartbeatRepository _repository;

  @override
  Future<Stream<void>> buildUseCaseStream(FoxbitWebSocket params) async {
    final StreamController<void> controller = StreamController<void>();
    
    try {
      final Map _ = await _repository.send(params);

      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}