import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';

class LoyaltyHeaderBanner extends StatelessWidget {
  const LoyaltyHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isSmall = screenWidth < 350;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          child: Image.asset(
            AppAssets.bonusCoffeeBG,
            width: double.infinity,
            height: screenHeight * 0.25, 
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 16,
          top: MediaQuery.of(context).padding.top + 8,
          child: IconButton(
            icon: SvgPicture.asset(
              AppAssets.circleArrowBack,
              width: 26,
              color: AppColors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          left: 24,
          bottom: 22,
          right: 24,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.bonusCoffeeCup,
                width: isSmall ? 60 : 80,
                height: isSmall ? 60 : 80,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '7-й кофе бесплатно',
                      style: TextStyle(
                        fontSize: isSmall ? 16 : 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '7-кофе акысыз',
                      style: TextStyle(
                        fontSize: isSmall ? 14 : 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
