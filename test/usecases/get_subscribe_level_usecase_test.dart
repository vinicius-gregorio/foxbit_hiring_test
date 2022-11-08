import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/repositories/subscribe_level_repository.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_subscribe_level_usecase.dart';

import '../connections/test_websocket.dart';
import '../utils/default_test_observer.dart';

void main() {
  TestFoxbitWebSocket webSocket;
  GetSubscribeLevelUsecase useCase;
  DefaultTestObserver observer;
  GetSubscribeLevelUsecaseParams params = GetSubscribeLevelUsecaseParams('1');

  setUp(() {
    webSocket = TestFoxbitWebSocket();
    useCase = GetSubscribeLevelUsecase(SubscribeLevelRepository(), params);
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

  test('Validate websocket getInstruments message formation', () async {
    useCase.execute(observer, webSocket);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }

    expect(observer.done, true);
    expect(observer.error, false);
    expect(webSocket.sendedMessages.last, '{"m":0,"i":0,"n":"getInstruments","o":"{}"}');
  });

  test('Validate retrieving list of InstrumentEntity', () async {
    useCase.execute(observer, webSocket);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }

    expect(observer.done, true);
    expect(observer.error, false);
    expect(webSocket.sendedMessages.last, '{"m":0,"i":0,"n":"getInstruments","o":"{}"}');
    final result = observer.data as List<InstrumentEntity>;
    expect(result, isA<List<InstrumentEntity>>());
  });
}
//test