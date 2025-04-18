import 'package:flutter/material.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/extensions/context_extension.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/all_promotions/widgets/loyalty_banner/qr_dialog.dart';

class LoyaltyProgramBanner extends StatelessWidget {
  const LoyaltyProgramBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.uiDarkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.mediumPadding,
          vertical: AppDimens.mediumPadding,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.lang.loyaltyProgramTitle,
                    style: AppTextStyles.s20w600.copyWith(
                      color: AppColors.titleWhite,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    context.lang.loyaltyProgramSubTitle,
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.titleWhite,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    context.lang.loyaltyProgramCount,
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.titleWhite,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (_) => const QrDialog());
              },

              child: Image.asset(AppAssets.qr, width: 100, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
