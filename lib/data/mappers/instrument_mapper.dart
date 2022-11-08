import 'package:foxbit_hiring_test_template/data/models/instrument_model.dart';

// ignore: avoid_classes_with_only_static_members
class InstrumentMapper {
  static InstrumentModel fromJson(dynamic data) {
    return InstrumentModel(
      instrumentId: data['InstrumentId'].toString(),
      symbol: data['Symbol'].toString(),
      sortIndex: data['SortIndex'].toString(),
    );
  }
}
