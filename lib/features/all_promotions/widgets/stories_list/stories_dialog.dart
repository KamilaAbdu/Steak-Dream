import 'package:flutter/material.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/all_promotions/widgets/stories_list/stories_default_icon.dart';
import 'package:steak_dream/features/stories/data/model/stories_model.dart';

class StoryDialog extends StatelessWidget {
  final StoryModel story;

  const StoryDialog({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgraoundBlack,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: story.imageUrl.isNotEmpty
                  ? Image.network(
                      story.imageUrl,
                      width: 240,
                      height: 240,
                      fit: BoxFit.cover,
                    )
                  : const DefaultIcon(size: 240),
            ),
            const SizedBox(height: 16),
            Text(
              story.title.isNotEmpty ? story.title : "Кешбеки",
              style: AppTextStyles.s20w500.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.uiLightGrey,
              ),
              child: const Text("Закрыть"),
            ),
          ],
        ),
      ),
    );
  }
}
