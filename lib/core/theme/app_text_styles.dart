import 'package:flutter/material.dart';
import 'package:steak_dream/core/theme/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle s16w400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle s10w500 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle s16w500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle s16w600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle s16w700 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle s12w400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle s14w500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle s34w400 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle s14w400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle s20w500 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle s20w600 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s20w700 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s18w700 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle s18w600 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s22w700 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle mainHeader = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'gillsans',
    color: AppColors.white,
  );

  static const TextStyle productTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'gillsans',
    color: AppColors.white,
  );

  static const TextStyle productAddToCartButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'gillsans',
    color: AppColors.white,
  );

  static const TextStyle productPrice = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'ubundu',
    color: AppColors.textWhite,
  );

  static const TextStyle productOldPrice = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'ubundu',
    color: AppColors.textGrey,
  );
}
