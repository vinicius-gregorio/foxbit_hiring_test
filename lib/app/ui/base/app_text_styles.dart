import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/ui/base/app_colors.dart';

class AppTextStyles {
  static const TextStyle rollingPxChangePositive = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.quotationPositive,
  );
  static const TextStyle rollingPxChangeNegative = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.quotationNegative,
  );

  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColors.textColor,
  );

  static const TextStyle symbol = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textColorFaded,
  );

  static const TextStyle assetName = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );
  static const TextStyle rollingVolume = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );
}
