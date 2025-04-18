import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/features/all_promotions/widgets/build_app_bar.dart';

@RoutePage()
class AllPromotionsScreen extends StatefulWidget {
  const AllPromotionsScreen({super.key});

  @override
  State<AllPromotionsScreen> createState() => _AllPromotionsScreenState();
}

class _AllPromotionsScreenState extends State<AllPromotionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraoundBlack,
      appBar: buildAppBar(context),
      body: SafeArea(child: Column(children: [SizedBox(height: 22)])),
    );
  }
}
