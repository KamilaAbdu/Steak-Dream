import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:steak_dream/features/cart/presentation/widgets/cart_empty.dart';
import 'package:steak_dream/features/cart/presentation/widgets/cart_list_view.dart';
import 'package:steak_dream/features/cart/presentation/widgets/cart_needs_auth.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  final bool isAuthorized;

  const CartScreen({super.key, this.isAuthorized = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraoundBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Корзина", style: AppTextStyles.mainHeader),
        leading: IconButton(
          icon: SvgPicture.asset(
            AppAssets.circleArrowBack,
            width: 26,
            color: AppColors.white,
          ),
          onPressed: () => context.router.push(PromotionsListRoute()),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (!isAuthorized) return const CartNeedsAuth();
          if (state is CartUpdated && state.items.isEmpty) {
            return const CartEmpty();
          }
          if (state is CartUpdated) return CartListView(items: state.items);
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
