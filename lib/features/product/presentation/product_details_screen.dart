import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/product/domain/entities/product_entity.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.entity});

  final ProductEntity entity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraoundBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(entity.title, style: AppTextStyles.mainHeader),
        leading: IconButton(
          icon: SvgPicture.asset(
            AppAssets.circleArrowBack,
            width: 26,
            color: AppColors.white,
          ),
          onPressed: () => context.router.pop(),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppAssets.bonusItem,
              width: 26,
              color: AppColors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
