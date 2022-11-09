import 'dart:developer';

import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/data/mappers/asset_mapper.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/quotation_repository.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_quotation_usecase.dart';

class QuotationRepository implements IQuotationRepository {
  final String _eventName = ConstantsEventsNames.subscribeLevel;
  List<AssetEntity> resultList = [];

  @override
  Future<List<AssetEntity>> getQuotations(GetQuotationUsecaseParams params) async {
    print("getQuotations usecase");

    for (final instrument in params.instrumentsIds) {
      await Future.delayed(const Duration(milliseconds: 500));
      params.ws.send(_eventName, {"InstrumentId": instrument.instrumentId});
      params.ws.stream.firstWhere((element) {
        final message = element["o"];
        log(message.toString());
        AssetEntity data = AssetMapper.fromJson(message as Map<String, dynamic>);
        data.symbol = instrument.symbol;
        data.instrumentId = instrument.instrumentId;
        for (int i = 0; i < resultList.length; i++) {
          final item = resultList[i];
          if (item.symbol == data.symbol) {
            resultList.removeAt(i);
          }
        }
        if (!resultList.contains(data)) {
          resultList.add(data);
        }
        return element['n'].toString().toUpperCase() == _eventName.toUpperCase() &&
            element['i'] == params.ws.lastId;
      });
    }
    print(resultList.length);

    return Future.value(resultList);
  }
}
