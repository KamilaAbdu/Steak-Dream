import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/extensions/context_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import 'package:steak_dream/core/theme/app_colors.dart';

@RoutePage()
class MainTabWrapperScreen extends StatelessWidget {
  const MainTabWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        AllPromotionsRoute(),
        FavoriteRoute(),
        CatalogRoute(),
        CartRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.uiDarkGrey,
              borderRadius: BorderRadius.circular(40),
            ),
            width: 358,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                final isSelected = tabsRouter.activeIndex == index;

                final icon =
                    [
                      AppAssets.mainNavigationBarItem,
                      AppAssets.favoriteNavigationBarItem,
                      AppAssets.catalogNavigationBarItem,
                      AppAssets.cartItem,
                      AppAssets.profileNavigationBarItem,
                    ][index];

                final label =
                    [
                      context.lang.mainNavigationBarItem,
                      context.lang.favoriteNavigationBarItem,
                      context.lang.catalogNavigationBarItem,
                      context.lang.cartNavigationBarItem,
                      context.lang.profileNavigationBarItem,
                    ][index];

                return GestureDetector(
                  onTap: () => tabsRouter.setActiveIndex(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration:
                        isSelected
                            ? BoxDecoration(
                              color: AppColors.orangeBackgroundTransparent20,
                              borderRadius: BorderRadius.circular(40),
                            )
                            : null,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          icon,
                          height: 30,
                          width: 30,
                          colorFilter: ColorFilter.mode(
                            isSelected
                                ? AppColors.white
                                : AppColors.uiLightGrey,
                            BlendMode.srcIn,
                          ),
                        ),
                        if (isSelected) ...[
                          const SizedBox(width: 8),
                          Text(
                            label,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
