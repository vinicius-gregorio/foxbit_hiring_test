import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

abstract class IInstrumentRepository {
  Future<List<InstrumentEntity>> getInstrumentId(FoxbitWebSocket ws);
}
