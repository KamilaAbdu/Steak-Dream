import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/promotion_title.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/recomended_banner/recommended_banner.dart';
import 'package:steak_dream/features/product/domain/entities/product_entity.dart';
import 'package:steak_dream/features/product/presentation/widgets/add_to_cart_button.dart';

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
            icon: SvgPicture.asset(AppAssets.shareItem, width: 26),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.mediumPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              entity.imageUrl,
              height: 358,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: AppDimens.extraLargePadding),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.title,
                      style: AppTextStyles.detailedProductHeader.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      '1000r',
                      style: AppTextStyles.detailedProductDescription,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${entity.price}с',
                      style: AppTextStyles.detailedProductHeader,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.bonusItem,
                          height: 14,
                          width: 14,
                          color: AppColors.yellow,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '+${entity.bonus} бонусов',
                          style: AppTextStyles.detailedProductDescription
                              .copyWith(color: AppColors.yellow),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppDimens.extraLargePadding),

            Text(
              entity.desc ?? '',
              style: AppTextStyles.detailedProductDescription.copyWith(
                color: AppColors.titleWhite,
              ),
            ),
            const SizedBox(height: 40),
            const PromotionTitle(title: 'Возможно вы ищете'),
            const SizedBox(height: AppDimens.mediumPadding),
            const RecommendedBanner(),
            const SizedBox(height: 120),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimens.mediumPadding),
        child: AddToCartButton(product: entity, height: 41,),
      ),
    );
  }
}
