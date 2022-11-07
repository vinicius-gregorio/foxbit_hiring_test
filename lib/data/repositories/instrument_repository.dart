import 'dart:developer';

import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/instrument_repository.dart';

class InstrumentRepository implements IInstrumentRepository {
  final String _eventName = ConstantsEventsNames.getInstruments;

  @override
  Future<Map> getInstrumentId(FoxbitWebSocket ws) {
    ws.send(_eventName, {});

    return ws.stream.firstWhere((message) {
      log("message  $message");
      log(" \n -----------------\n");
      return message['n'].toString().toUpperCase() == _eventName && message['i'] == ws.lastId;
    });
  }
}
