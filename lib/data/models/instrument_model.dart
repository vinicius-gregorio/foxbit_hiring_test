import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

class InstrumentModel extends InstrumentEntity {
  InstrumentModel({
    String instrumentId,
    String symbol,
    String sortIndex,
  }) : super(
          instrumentId: instrumentId,
          symbol: symbol,
          sortIndex: sortIndex,
        );
}
