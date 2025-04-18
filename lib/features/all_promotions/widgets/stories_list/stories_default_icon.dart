import 'package:flutter/material.dart';
import 'package:steak_dream/core/theme/app_colors.dart';


class DefaultIcon extends StatelessWidget {
  final double size;

  const DefaultIcon({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: AppColors.uiLightGrey.withOpacity(0.1),
      child: const Icon(
        Icons.image_not_supported_outlined,
        color: Colors.white70,
        size: 28,
      ),
    );
  }
}
