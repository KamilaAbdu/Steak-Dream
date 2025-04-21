import 'package:flutter/material.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/extensions/context_extension.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.uiDarkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
        child: Row(
          children: [
            Image.asset(AppAssets.promotionItem,width: 80,),
            SizedBox(width: AppDimens.mediumPadding),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.lang.promotionItemTitle,
                    style: AppTextStyles.s18w700.copyWith(
                      color: AppColors.white,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    context.lang.promotionItemSubTitle,
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.titleWhite,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
