import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';

class AssetModel extends AssetEntity {
  AssetModel({
    String lastTradedPx,
    String rolling24HrVolume,
    String rolling24HrPxChange,
  }) : super(
            lastTradedPx: lastTradedPx,
            rolling24HrVolume: rolling24HrVolume,
            rolling24HrPxChange: rolling24HrPxChange);
}
