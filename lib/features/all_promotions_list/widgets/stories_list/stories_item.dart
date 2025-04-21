import 'package:flutter/material.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/stories_list/stories_default_icon.dart';
import 'package:steak_dream/features/stories/data/model/stories_model.dart';

class StoriesItem extends StatelessWidget {
  final StoryModel story;
  final bool isViewed;
  final VoidCallback onTap;

  const StoriesItem({
    super.key,
    required this.story,
    required this.isViewed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isImageAvailable = story.imageUrl.isNotEmpty;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 82,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.uiLightGrey),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isViewed ? AppColors.uiLightGrey : Colors.amberAccent,
                  width: 3,
                ),
              ),
              child: ClipOval(
                child:
                    isImageAvailable
                        ? Image.network(
                          story.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => DefaultIcon(),
                        )
                        : DefaultIcon(),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              story.title.isNotEmpty ? story.title : "Кешбеки",
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
