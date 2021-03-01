import 'dart:async';

import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';

class TestFoxbitWebSocket extends FoxbitWebSocket {
  List<String> sendedMessages = [];

  final Map _responses = {
    // ignore: unnecessary_string_escapes
    'PING': '{"m": 0, "i": 0, "n": "Ping", "o": "{\\\"msg\\\":\\\"PONG\\\"}" }'
  };

  @override
  void send(String method, dynamic objectData) {
    prepareMessage(method, objectData);
    
    final response = _responses[method];
    if (response != null) {
      Timer(const Duration(milliseconds: 50), () {
        onMessage(response);
      });
    }
  }

  @override
  String prepareMessage(String method, dynamic objectData) {
    final String message = super.prepareMessage(method, objectData);
    sendedMessages.add(message);
    return message;
  }
}