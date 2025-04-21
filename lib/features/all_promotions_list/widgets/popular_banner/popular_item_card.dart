import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';

class PopularItemCard extends StatelessWidget {
  final String title;
  final String image;
  final int price;
  final int? oldPrice;

  const PopularItemCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 279,
      decoration: BoxDecoration(
        color: AppColors.backgraoundBlack,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              height: 269,
              width: 358,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30,
            left: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.s20w600.copyWith(color: AppColors.white),
                ),
                SizedBox(height: 69,),
                Container(
                  height: 39,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$priceс',
                    style: AppTextStyles.s18w700.copyWith(color: AppColors.textWhite),
                  ),
                ),
                if (oldPrice != null)
                SizedBox(height: 10),
          
                  Text(
                    '$oldPrice сом',
                    style: AppTextStyles.s14w400.copyWith(
                      color: AppColors.white,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.white
                    ),
                  ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  width: 50,
                  height: 42,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white),
                    shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.cartItem,
                      width: 30,
                      height: 30,
                      color: AppColors.titleWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
