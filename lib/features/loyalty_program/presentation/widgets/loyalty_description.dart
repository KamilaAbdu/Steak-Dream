import 'package:flutter/material.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';

class LoyaltyDescription extends StatelessWidget {
  const LoyaltyDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Получите 7-й кофе в подарок',
            style: AppTextStyles.s22w700.copyWith(
              color: AppColors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Приобретай кофе любого формата и объёма с использованием мобильного приложения. Предоставь QR-код из мобильного приложения на кассе, при проведении оплаты, в приложении будет отражено количество купленного кофе, 7-й кофе бесплатно.',
            style: AppTextStyles.s16w400.copyWith(
              color: AppColors.subTitleWhite,
            ),
          ),
        ),
      ],
    );
  }
}