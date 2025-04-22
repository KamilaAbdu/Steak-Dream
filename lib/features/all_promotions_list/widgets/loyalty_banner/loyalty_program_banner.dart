import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/promotion_title.dart';
import 'package:steak_dream/features/loyalty_program/presentation/bloc/loyalty_bloc.dart';
import 'package:steak_dream/features/loyalty_program/presentation/bloc/loyalty_event.dart';

class LoyaltyProgramBanner extends StatelessWidget {
  const LoyaltyProgramBanner({super.key});

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.asset(
                      AppAssets.bonusCoffeeBG,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: AppColors.blackTransparent40, 
                    ),
                  ],
                ),
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
              const SizedBox(width: 33),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.read<LoyaltyBloc>().add(LoadLoyaltyProgress());
                    context.pushRoute(const LoyaltyRoute());
                  },
                  child: Column(
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
