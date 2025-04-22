import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/loyalty_banner/loyalty_program_banner.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/build_app_bar.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/bonus_card/bonus_card_banner.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/popular_banner/popular_banner.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/promotion_banner/promotion_banner.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/promotion_title.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/recomended_banner/recommended_banner.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/stories_list/stories_horizontal_scrolling_list.dart';
import 'package:steak_dream/features/product/presentation/bloc/product_bloc.dart';
import 'package:steak_dream/features/product/presentation/widgets/product_grid.dart';
import 'package:steak_dream/features/stories/presentation/bloc/stories_bloc.dart';
import 'package:steak_dream/features/stories/presentation/bloc/stories_event.dart';
import 'package:steak_dream/features/stories/presentation/bloc/stories_state.dart';

@RoutePage()
class PromotionsListScreen extends StatefulWidget {
  const PromotionsListScreen({super.key});
  

  @override
  State<PromotionsListScreen> createState() => _PromotionsListScreenState();
}

class _PromotionsListScreenState extends State<PromotionsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoriesBloc>().add(FetchStories());
    context.read<ProductBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
  


    return Scaffold(
      backgroundColor: AppColors.backgraoundBlack,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.mediumPadding,
          ),
          child: ListView(
            children: [
              const SizedBox(height: AppDimens.mediumPadding),
              BlocBuilder<StoriesBloc, StoriesState>(
                builder: (context, state) {
                  if (state is StoriesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is StoriesLoaded) {
                    return StoriesHorizontalScrollingList(
                      stories: state.stories,
                    );
                  } else if (state is StoriesError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: AppDimens.extraLargePadding),
              const BonusCardBanner(),
              const SizedBox(height: AppDimens.extraLargePadding),
              const PromotionBanner(),
              const SizedBox(height: AppDimens.extraLargePadding),
              const LoyaltyProgramBanner(),
              const SizedBox(height: 40),
              
              PopularBanner(),
              const SizedBox(height: AppDimens.extraLargePadding),
              const RecommendedBanner(),
              const SizedBox(height: AppDimens.extraLargePadding),
              PromotionTitle(title: 'Наши продукции'),
              const SizedBox(height: AppDimens.mediumPadding),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    return ProductGrid(products: state.products);
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: AppDimens.extraLargePadding),
            ],
          ),
        ),
      ),
    );
  }
}
