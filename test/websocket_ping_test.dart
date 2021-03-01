import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/repositories/heartbeat_repository.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/heartbeat_usecase.dart';

import 'connections/test_websocket.dart';
import 'utils/default_test_observer.dart';

void main() {
  TestFoxbitWebSocket webSocket;
  HeartbeatUseCase useCase;
  DefaultTestObserver observer;

  setUp(() {
    webSocket = TestFoxbitWebSocket();
    useCase = HeartbeatUseCase(HeartbeatRepository());
    observer = DefaultTestObserver();
  });

  tearDown(() {
    useCase.dispose();
  });

  test('Validate correct execution', () async {
    useCase.execute(observer, webSocket);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }

    expect(observer.done, true);
    expect(observer.error, false);
  });

  test('Validate websocket ping message formation', () async {
    useCase.execute(observer, webSocket);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }

    expect(observer.done, true);
    expect(observer.error, false);
    expect(webSocket.sendedMessages.last, '{"m":0,"i":0,"n":"PING","o":"{}"}');
  });
}