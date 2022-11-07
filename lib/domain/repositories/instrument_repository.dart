import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';

abstract class IInstrumentRepository {
  Future<Map> getInstrumentId(FoxbitWebSocket ws);
}
