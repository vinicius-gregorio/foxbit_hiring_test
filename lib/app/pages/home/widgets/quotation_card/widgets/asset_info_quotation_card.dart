import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/utils/widget_utils/get_asset_name_based_on_asset.dart';
import 'package:foxbit_hiring_test_template/app/utils/widget_utils/get_image_path_based_instrument_id.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/app/utils/extensions/string_extension.dart';

class AssetInfoQuotationCard extends StatelessWidget {
  final AssetEntity asset;
  const AssetInfoQuotationCard({Key key, @required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgPath = getAssetImagePathBasedOnInstrumentId(asset.instrumentId);
    String assetName = getAssetNameBasedOnInstrumentId(asset);
    bool checkDuplicityAssetName = assetName == asset.symbol.formatSymbol();
    String symbol = checkDuplicityAssetName ? "" : asset.symbol.formatSymbol();
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(60),
            ),
            child: imgPath == "" ? const SizedBox.shrink() : Image.asset(imgPath),
          ),
          Column(
            crossAxisAlignment:
                checkDuplicityAssetName ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(assetName),
              Text(symbol),
            ],
          )
        ],
      ),
    );
  }
}
