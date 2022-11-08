import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/data/mappers/instrument_mapper.dart';
import 'package:foxbit_hiring_test_template/data/models/instrument_model.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/instrument_repository.dart';

class InstrumentRepository implements IInstrumentRepository {
  final String _eventName = ConstantsEventsNames.getInstruments;
  List<InstrumentModel> resultList = [];

  @override
  Future<List<InstrumentModel>> getInstrumentId(FoxbitWebSocket ws) async {
    ws.send(_eventName, {});

    ws.stream.firstWhere((message) {
      final messages = message["o"];
      final messagesLength = messages.length - 1 as int;

      if (messagesLength != 0) {
        final mList = messages as List;

        final instruments = mList.map((dynamic m) => InstrumentMapper.fromJson(m)).toList();
        resultList = instruments;
      }
      return message['n'].toString().toUpperCase() == _eventName && message['i'] == ws.lastId;
    });

    return Future.value(resultList);
  }
}
