import 'package:flutter/material.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';


class EmptyFavoriteView extends StatelessWidget {
  const EmptyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.emptyBasket,
            width: screenWidth * 0.6, 
            height: screenHeight * 0.3,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: AppDimens.mediumPadding),
          Text(
            'У вас нет избранных товаров',
            textAlign: TextAlign.center,
            style: AppTextStyles.productTitle.copyWith(
              color: AppColors.titleWhite,
            ),
          ),
        ],
      ),
    );
  }
}
