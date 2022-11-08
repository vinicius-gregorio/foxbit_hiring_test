import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/data/models/instrument_model.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/quotation_repository.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_quotation_usecase.dart';

class QuotationRepository implements IQuotationRepository {
  final String _eventName = ConstantsEventsNames.subscribeLevel;
  List<InstrumentModel> resultList = [];

  @override
  Future<AssetEntity> getQuotations(FoxbitWebSocket ws, GetSubscribeLevelUsecaseParams params) {
    // TODO: implement getQuotation
    throw UnimplementedError();
  }

  // @override
  // Future<SubscribeLevelEntity> getInstrumentId(FoxbitWebSocket ws) async {
  //   ws.send(_eventName, {});

  //   ws.stream.firstWhere((message) {
  //     final messages = message["o"];
  //     final messagesLength = messages.length - 1 as int;

  //     if (messagesLength != 0) {
  //       final mList = messages as List;

  //       final instruments = mList.map((dynamic m) => InstrumentMapper.fromJson(m)).toList();
  //       resultList = instruments;
  //     }
  //     return message['n'].toString().toUpperCase() == _eventName && message['i'] == ws.lastId;
  //   });

  //   return Future.value(resultList);
  // }
}
