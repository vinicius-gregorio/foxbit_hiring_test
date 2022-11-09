import 'package:foxbit_hiring_test_template/app/utils/extensions/string_extension.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';

String getAssetNameBasedOnInstrumentId(AssetEntity asset) {
  switch (asset.instrumentId) {
    case "1":
      return "Bitcoin";
    case "10":
      return "XRP";
    case "6":
      return "TrueUSD";
    case "4":
      return "Ethereum";
    case "2":
      return "Litecoin";
    default:
      return asset.symbol.formatSymbol();
  }
}
