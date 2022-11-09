import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/repositories/quotation_repository.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_quotation_usecase.dart';

import '../connections/test_websocket.dart';
import '../utils/default_test_observer.dart';

void main() {
  TestFoxbitWebSocket webSocket = TestFoxbitWebSocket();
  GetQuotationUsecase useCase;
  DefaultTestObserver observer;

  final GetQuotationUsecaseParams params = GetQuotationUsecaseParams([
    InstrumentEntity(instrumentId: "1", sortIndex: "1", symbol: "asd"),
    InstrumentEntity(instrumentId: "1", sortIndex: "1", symbol: "asd"),
    InstrumentEntity(instrumentId: "1", sortIndex: "1", symbol: "asd"),
  ], webSocket);
  setUp(() {
    webSocket = TestFoxbitWebSocket();
    useCase = GetQuotationUsecase(QuotationRepository());
    observer = DefaultTestObserver();
  });

  tearDown(() {
    useCase.dispose();
  });

  test('Validate correct execution', () async {
    useCase.execute(observer, params);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 3000));
    }

    expect(observer.done, true);
    expect(observer.error, false);
  });

  test('Validate correct execution with empty params', () async {
    useCase.execute(observer, GetQuotationUsecaseParams([], webSocket));
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 3000));
    }

    expect(observer.done, true);
    expect(observer.error, false);
  });

  test('Validate correct execution with empty params and null ws', () async {
    useCase.execute(observer, GetQuotationUsecaseParams([], null));
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 3000));
    }

    expect(observer.done, true);
    expect(observer.error, false);
  });

  test('Validate correct execution with empty params and empty ws', () async {
    useCase.execute(observer, GetQuotationUsecaseParams([], TestFoxbitWebSocket()));
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 3000));
    }

    expect(observer.done, true);
    expect(observer.error, false);
  });
}
