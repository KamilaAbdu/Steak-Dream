import 'dart:async';
import 'package:flutter/material.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/stories/data/model/stories_model.dart';

class StoriesDialog extends StatefulWidget {
  final StoryModel story;

  const StoriesDialog({super.key, required this.story});

  @override
  State<StoriesDialog> createState() => _StoriesDialogState();
}

class _StoriesDialogState extends State<StoriesDialog>
    with TickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  void _close() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: AppColors.orangeBackground,
      child: GestureDetector(
        onTap: _close,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Center(
                  child: widget.story.imageUrl.isNotEmpty
                      ? Image.network(
                        widget.story.imageUrl,
                        height: 300,
                        width: 358,
                        fit: BoxFit.contain,
                      )
                      : Image.asset(AppAssets.meat, height: 300, width: 358),
                ),
                const SizedBox(
                  height: 40,
                ), 
                Text(
                  widget.story.title.isNotEmpty
                      ? widget.story.title
                      : "Попробуйте новый вкус",
                  style: AppTextStyles.mainHeader.copyWith(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            Positioned(
              top: 40,
              left: 12,
              right: 12,
              child: AnimatedBuilder(
                animation: _progressController,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: _progressController.value,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
