import 'package:foxbit_hiring_test_template/app/ui/base/app_images.dart';

String getAssetImagePathBasedOnInstrumentId(String instrumentId) {
  if (!AppImages.instrumentsThatContainsImages.contains(instrumentId)) {
    return "";
  }
  return "assets/images/$instrumentId.png";
}
