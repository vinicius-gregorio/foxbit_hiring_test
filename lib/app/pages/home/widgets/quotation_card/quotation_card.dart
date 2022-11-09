import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/ui/base/app_text_styles.dart';
import 'package:foxbit_hiring_test_template/domain/entities/subscribe_level_entity.dart';
import 'package:foxbit_hiring_test_template/app/utils/extensions/string_extension.dart';

class QuotationCard extends StatelessWidget {
  final AssetEntity asset;
  const QuotationCard({Key key, @required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(asset.symbol),
            Text(
              asset.rolling24HrPxChange,
              style: asset.rolling24HrPxChange.startsWith('-')
                  ? AppTextStyles.rollingPxChangeNegative
                  : AppTextStyles.rollingPxChangePositive,
            ),
            Text(asset.rolling24HrVolume.formatToBrl()),
          ],
        ),
      ),
    );
  }
}