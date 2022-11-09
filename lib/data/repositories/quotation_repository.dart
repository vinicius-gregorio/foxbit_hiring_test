import 'dart:developer';

import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/quotation_repository.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_quotation_usecase.dart';

class QuotationRepository implements IQuotationRepository {
  final String _eventName = ConstantsEventsNames.subscribeLevel;
  List<AssetEntity> resultList = [];

  @override
  Future<List<AssetEntity>> getQuotations(GetQuotationUsecaseParams params) {
    print("getQuotations usecase");

    // ws.send(_eventName, {"InstrumentId": 2});

    // ws.stream.firstWhere((message) {
    //   final messages = message["o"];

    //   if (message['n'].toString().toUpperCase() == _eventName.toUpperCase()) {
    //     log(message["o"].toString());
    //   }
    //   return message['n'].toString().toUpperCase() == _eventName && message['i'] == ws.lastId;
    // });

    for (var instrument in params.instrumentsIds) {
      print("start for");
      params.ws.send(_eventName, {"InstrumentId": 2});
      params.ws.stream.firstWhere((element) {
        final messages = element["o"];
        log(messages.toString());

        return element['n'].toString().toUpperCase() == _eventName &&
            element['i'] == params.ws.lastId;
      });
    }
    return Future.value(resultList);
  }
}
