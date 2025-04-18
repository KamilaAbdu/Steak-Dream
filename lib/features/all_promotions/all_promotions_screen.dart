import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/features/bonus_coffee/bonus_coffee_banner.dart';
import 'package:steak_dream/features/all_promotions/widgets/build_app_bar.dart';
import 'package:steak_dream/features/all_promotions/widgets/loyalty_banner/loyalty_program_banner.dart';
import 'package:steak_dream/features/all_promotions/widgets/popular_banner/popular_banner.dart';
import 'package:steak_dream/features/all_promotions/widgets/promotion_banner/promotion_banner.dart';
import 'package:steak_dream/features/all_promotions/widgets/recomended_banner/recommended_banner.dart';
import 'package:steak_dream/features/all_promotions/widgets/stories_list/stories_horizontal_scrolling_list.dart';
import 'package:steak_dream/features/stories/presentation/bloc/stories_bloc.dart';
import 'package:steak_dream/features/stories/presentation/bloc/stories_event.dart';
import 'package:steak_dream/features/stories/presentation/bloc/stories_state.dart';

@RoutePage()
class AllPromotionsScreen extends StatefulWidget {
  const AllPromotionsScreen({super.key});

  @override
  State<AllPromotionsScreen> createState() => _AllPromotionsScreenState();
}

class _AllPromotionsScreenState extends State<AllPromotionsScreen> {
  @override
  void initState() {
    context.read<StoriesBloc>().add(FetchStories());
    super.initState();
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
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: AppDimens.extraLargePadding),
              LoyaltyProgramBanner(),
              const SizedBox(height: AppDimens.extraLargePadding),
              PromotionBanner(),
              const SizedBox(height: AppDimens.extraLargePadding),
              BonusCoffeeBanner(),
              SizedBox(height: 40),
              PopularBanner(),
              const SizedBox(height: AppDimens.extraLargePadding),
              RecommendedBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
