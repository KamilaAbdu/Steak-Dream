import 'package:auto_route/auto_route.dart';
import 'package:steak_dream/features/all_promotions/all_promotions_screen.dart';
import 'package:steak_dream/features/cart/cart_screen.dart';
import 'package:steak_dream/features/catalog/catalog_screen.dart';
import 'package:steak_dream/features/favorite/favorite_screen.dart';
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
        AutoRoute(page: AllPromotionsRoute.page, path: 'allPromotions'),
        AutoRoute(page: FavoriteRoute.page, path: 'favorite'),
        AutoRoute(page: CartRoute.page, path: 'cart'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
        AutoRoute(page: CatalogRoute.page, path: 'catalog'),
      ],
    ),
    AutoRoute(page: StoriesRoute.page)
  ];

  
}
