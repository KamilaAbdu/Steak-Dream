import 'package:flutter/material.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/all_promotions/widgets/promotion_title.dart';

class BonusCoffeeBanner extends StatelessWidget {
  const BonusCoffeeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PromotionTitle(title: 'Плюс один'),
            SizedBox(height: AppDimens.mediumPadding),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgraoundBlack,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                AppAssets.bonusCoffeeBG,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Positioned(
          left: 21,
          top: 40,
          bottom: 0,
          child: Row(
            children: [
              Image.asset(AppAssets.bonusCoffeeCup, width: 80),
              SizedBox(width: 33),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '7-й кофе бесплатно',
                    style: AppTextStyles.s18w700.copyWith(
                      color: AppColors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    '7-кофе акысыз',
                    style: AppTextStyles.s18w700.copyWith(
                      color: AppColors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
