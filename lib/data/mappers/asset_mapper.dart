import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';

// ignore: avoid_classes_with_only_static_members
class AssetMapper {
  static AssetEntity fromJson(Map<String, dynamic> json) {
    return AssetEntity(
      lastTradedPx: json['LastTradedPx'].toString(),
      rolling24HrVolume: json['Rolling24HrVolume'].toString(),
      rolling24HrPxChange: json['Rolling24HrPxChange'].toString(),
    );
  }
}
