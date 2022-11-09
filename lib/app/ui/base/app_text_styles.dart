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

  // create symbol text style with less font weight
  static const TextStyle symbol = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textColorFaded,
  );
}
