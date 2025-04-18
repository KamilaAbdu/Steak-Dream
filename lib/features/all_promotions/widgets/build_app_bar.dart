import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/provider/theme_provider.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';

AppBar buildAppBar(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text("SteakDream", style: AppTextStyles.mainHeader),
    centerTitle: false,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: () {
            themeProvider.toggleTheme();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 80,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.uiDarkGrey,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment:
                      themeProvider.isDark
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      AppAssets.themeSwicherIcon,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
