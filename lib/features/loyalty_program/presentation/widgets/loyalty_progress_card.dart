import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/loyalty_program/presentation/widgets/loyalty_description.dart';
import 'package:steak_dream/features/loyalty_program/presentation/widgets/loyalty_header_banner.dart';
import '../../domain/entities/loyalty.dart';

class LoyaltyProgressCard extends StatelessWidget {
  final Loyalty loyalty;

  const LoyaltyProgressCard({super.key, required this.loyalty});

  @override
  Widget build(BuildContext context) {
    final current = 7;
    //loyalty.currentCount;
    final total = loyalty.maxCount;
    final isFull = current >= total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LoyaltyHeaderBanner(),
        const SizedBox(height: AppDimens.extraLargePadding),
        const LoyaltyDescription(),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.uiDarkGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Кофе 270–400 мл',
                      style: AppTextStyles.s18w700.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$current из $total',
                      style: AppTextStyles.s16w600.copyWith(
                        color: AppColors.uiLightGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimens.extraLargePadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(total, (index) {
                    final isFilled = index < current;
                    return SvgPicture.asset(
                      isFilled
                          ? AppAssets.coffeeCheckIconActive
                          : AppAssets.coffeeCheckIcon,
                      width: 40,
                      height: 40,
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset(
                      isFull ? AppAssets.giftIconActive : AppAssets.giftIcon,
                      width: isFull ? 70 : 50,
                      height: isFull ? 70 : 50,
                    ),
                    const SizedBox(width: 8),
                    if (isFull)
                      Expanded(
                        child: Text(
                          'Заберите свой подарок!',
                          style: AppTextStyles.s18w600.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
