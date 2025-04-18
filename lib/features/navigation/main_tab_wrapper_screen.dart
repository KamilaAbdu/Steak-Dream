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
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            backgroundColor: AppColors.uiDarkGrey,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.uiLightGrey,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.mainNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 0
                        ? AppColors.white
                        : AppColors.uiLightGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.mainNavigationBarItem,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.favoriteNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 1
                        ? AppColors.white
                        : AppColors.uiLightGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.favoriteNavigationBarItem,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.catalogNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 2
                        ? AppColors.white
                        : AppColors.uiLightGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.catalogNavigationBarItem,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.cartNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 3
                        ? AppColors.white
                        : AppColors.uiLightGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.cartNavigationBarItem,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.profileNavigationBarItem,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 3
                        ? AppColors.white
                        : AppColors.uiLightGrey,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.lang.profileNavigationBarItem,
              ),
            ],
          ),
        );
      },
    );
  }
}
