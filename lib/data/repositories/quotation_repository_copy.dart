import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';

import '../../domain/repositories/quotation_repository_copy.dart';
import '../../domain/usecases/get_quotation_usecase_copy.dart';

class QuotationRepository implements IQuotationRepository {
  final String _eventName = ConstantsEventsNames.subscribeLevel;
  List<AssetEntity> resultList = [];

  @override
  Future<List<AssetEntity>> getQuotations(GetQuotationUsecaseParamsz params) async {
    print("getQuotations repository copy");

    // ws.send(_eventName, {"InstrumentId": 2});

    // ws.stream.firstWhere((message) {
    //   final messages = message["o"];

    //   if (message['n'].toString().toUpperCase() == _eventName.toUpperCase()) {
    //     log(message["o"].toString());
    //   }
    //   return message['n'].toString().toUpperCase() == _eventName && message['i'] == ws.lastId;
    // });

    // for (final instrument in params.instrumentsIds) {
    // await Future.delayed(const Duration(milliseconds: 2000));
    // params.ws.send(_eventName, {"InstrumentId": instrument});
    // params.ws.stream.firstWhere((element) {
    //   final messages = element["o"];
    //   // log(messages.toString());
    //   resultList.add(AssetEntity(
    //       lastTradedPx: "a", rolling24HrPxChange: "b", rolling24HrVolume: "c", symbol: "d"));
    //   return element['n'].toString().toUpperCase() == _eventName &&
    //       element['i'] == params.ws.lastId;
    // });
    // }
    return Future.value(resultList);
  }
}
