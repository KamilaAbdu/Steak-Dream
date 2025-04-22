// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<CartRouteArgs> {
  CartRoute({Key? key, bool isAuthorized = true, List<PageRouteInfo>? children})
    : super(
        CartRoute.name,
        args: CartRouteArgs(key: key, isAuthorized: isAuthorized),
        initialChildren: children,
      );

  static const String name = 'CartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CartRouteArgs>(
        orElse: () => const CartRouteArgs(),
      );
      return CartScreen(key: args.key, isAuthorized: args.isAuthorized);
    },
  );
}

class CartRouteArgs {
  const CartRouteArgs({this.key, this.isAuthorized = true});

  final Key? key;

  final bool isAuthorized;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, isAuthorized: $isAuthorized}';
  }
}

/// generated route for
/// [CatalogScreen]
class CatalogRoute extends PageRouteInfo<void> {
  const CatalogRoute({List<PageRouteInfo>? children})
    : super(CatalogRoute.name, initialChildren: children);

  static const String name = 'CatalogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CatalogScreen();
    },
  );
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
    : super(FavoriteRoute.name, initialChildren: children);

  static const String name = 'FavoriteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoriteScreen();
    },
  );
}

/// generated route for
/// [LoyaltyScreen]
class LoyaltyRoute extends PageRouteInfo<void> {
  const LoyaltyRoute({List<PageRouteInfo>? children})
    : super(LoyaltyRoute.name, initialChildren: children);

  static const String name = 'LoyaltyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoyaltyScreen();
    },
  );
}

/// generated route for
/// [MainPromotionsScreen]
class MainPromotionsRoute extends PageRouteInfo<void> {
  const MainPromotionsRoute({List<PageRouteInfo>? children})
    : super(MainPromotionsRoute.name, initialChildren: children);

  static const String name = 'MainPromotionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPromotionsScreen();
    },
  );
}

/// generated route for
/// [MainTabWrapperScreen]
class MainTabWrapperRoute extends PageRouteInfo<void> {
  const MainTabWrapperRoute({List<PageRouteInfo>? children})
    : super(MainTabWrapperRoute.name, initialChildren: children);

  static const String name = 'MainTabWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainTabWrapperScreen();
    },
  );
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    Key? key,
    required ProductEntity entity,
    List<PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, entity: entity),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return ProductDetailsScreen(key: args.key, entity: args.entity);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.entity});

  final Key? key;

  final ProductEntity entity;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, entity: $entity}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [PromotionsListScreen]
class PromotionsListRoute extends PageRouteInfo<void> {
  const PromotionsListRoute({List<PageRouteInfo>? children})
    : super(PromotionsListRoute.name, initialChildren: children);

  static const String name = 'PromotionsListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PromotionsListScreen();
    },
  );
}

/// generated route for
/// [StoriesScreen]
class StoriesRoute extends PageRouteInfo<void> {
  const StoriesRoute({List<PageRouteInfo>? children})
    : super(StoriesRoute.name, initialChildren: children);

  static const String name = 'StoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StoriesScreen();
    },
  );
}
