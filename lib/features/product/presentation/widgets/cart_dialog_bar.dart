import 'package:flutter/material.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showCustomDialogBar(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 2), () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        }
      });

      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: 131,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.orangeBackgroundTransparent40,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.circleCheckIcon, width: 48),
              const SizedBox(height: AppDimens.mediumPadding),
              Text(
                message,
                style: AppTextStyles.s16w700.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}
