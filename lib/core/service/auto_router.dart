import 'package:auto_route/auto_route.dart';
import 'package:steak_dream/features/all_promotions/main_promotions_screen.dart';
import 'package:steak_dream/features/all_promotions/promotions_list.dart';
import 'package:steak_dream/features/cart/cart_screen.dart';
import 'package:steak_dream/features/catalog/catalog_screen.dart';
import 'package:steak_dream/features/favorite/favorite_screen.dart';
import 'package:steak_dream/features/loyalty_program/presentation/loyalty_screen.dart';
import 'package:steak_dream/features/navigation/main_tab_wrapper_screen.dart';
import 'package:steak_dream/features/profile/profile_screen.dart';
import 'package:steak_dream/features/stories/presentation/stories_screen.dart';

part 'package:steak_dream/core/service/auto_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
  page: MainTabWrapperRoute.page,
  initial: true,
  children: [
    AutoRoute(
      path: 'promotions',
      page: MainPromotionsRoute.page,
      children: [
        AutoRoute(path: '', page: PromotionsListRoute.page),
        AutoRoute(path: 'loyalty', page: LoyaltyRoute.page),
      ],
    ),
    AutoRoute(page: FavoriteRoute.page, path: 'favorite'),
    AutoRoute(page: CartRoute.page, path: 'cart'),
    AutoRoute(page: ProfileRoute.page, path: 'profile'),
    AutoRoute(page: CatalogRoute.page, path: 'catalog'),
  ],
),

    AutoRoute(page: StoriesRoute.page),

  ];

  
}
