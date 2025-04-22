import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';

@RoutePage()
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraoundBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Каталог", style: AppTextStyles.mainHeader),
        leading: IconButton(
          icon: SvgPicture.asset(
            AppAssets.circleArrowBack,
            width: 26,
            color: AppColors.white,
          ),
          onPressed: () => context.router.push(PromotionsListRoute()),
        ),
      ),
    );
  }
}