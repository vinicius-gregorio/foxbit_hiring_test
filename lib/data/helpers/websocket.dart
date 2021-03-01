
import 'dart:async';
import 'dart:convert';

import 'package:rxdart/subjects.dart';
import 'package:websok/io.dart';

import 'package:flutter/foundation.dart';

class FoxbitWebSocket {
  IOWebsok _socket;
  int _id = 0;
  bool _connectedByUser = false;

  final int _idStepSize = 2;

  @protected
  final BehaviorSubject<Map> streamController = BehaviorSubject<Map>();

  int get lastId => _id - _idStepSize;

  FoxbitWebSocket() {
    _socket = IOWebsok(host: 'api.foxbit.com.br?origin=android', tls: true);
  }
  
  void connect() {
    _socket.connect();
    _socket.listen(
      onData: onMessage,
      onDone: _onDone,
      cancelOnError: false
    );
    _connectedByUser = true;
    _id = 0;
  }

  Future<void> disconnect() async {
    _connectedByUser = false;
    await _socket.close();
  }

  bool get connected => _socket.isActive;

  void send(String method, dynamic data) {
    _socket.send(prepareMessage(method, data));
  }

  Stream<Map> get stream => streamController.stream;

  @protected
  String prepareMessage(String method, dynamic objectData) {
    final Map data = {
      "m": 0,
      "i": _id,
      "n": method,
      "o": json.encode(objectData)
    };

    _id += _idStepSize;

    return json.encode(data);
  }

  @protected
  void onMessage(dynamic message) {
    final Map data = json.decode(message.toString()) as Map;

    if (data['o'].toString().isNotEmpty) {
      data['o'] = json.decode(data['o'].toString());
    }
    
    streamController.add(data);
  }

  void _onDone() {
    if (_connectedByUser) {
      _reconnect();
    }
  }

  void _reconnect() {
    Timer(const Duration(seconds: 1), () async {
      connect();
    });
  }
}
