import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';

class QrDialog extends StatelessWidget {
  final String bonusAmount;

  const QrDialog({super.key, this.bonusAmount = '650.00'});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    return Dialog.fullscreen(
      backgroundColor: AppColors.backgraoundBlack,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.03,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppAssets.circleArrowBack,
                    width: 26,
                    color: AppColors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              SizedBox(height: isSmallScreen ? 24 : 48),

              Flexible(
                child: Container(
                  width: size.width * 0.75,
                  height: size.width * 0.75,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Image.asset(AppAssets.qr, fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: isSmallScreen ? 24 : 32),
              Expanded(
                child: Text(
                  "Покажите QR-код кассиру чтобы поменять их",
                  style: AppTextStyles.s16w400.copyWith(
                    color: AppColors.titleWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: isSmallScreen ? 16 : 32),
              Text(
                "$bonusAmount бонусов",
                style: AppTextStyles.s20w600.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
