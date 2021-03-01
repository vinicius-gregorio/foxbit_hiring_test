import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';

abstract class IHeartbeatRepository {
  Future<Map> send(FoxbitWebSocket ws);
}