import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/stories_list/stories_dialog.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/stories_list/stories_item.dart';
import 'package:steak_dream/features/stories/data/model/stories_model.dart';

class StoriesHorizontalScrollingList extends StatefulWidget {
  final List<StoryModel> stories;

  const StoriesHorizontalScrollingList({super.key, required this.stories});

  @override
  State<StoriesHorizontalScrollingList> createState() =>
      _StoriesHorizontalScrollingListState();
}

class _StoriesHorizontalScrollingListState
    extends State<StoriesHorizontalScrollingList> {
  Set<String> viewedStoryIds = {};

  @override
  void initState() {
    super.initState();
    _loadViewedStories();
  }

  Future<void> _loadViewedStories() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      viewedStoryIds = prefs.getStringList('viewed_stories')?.toSet() ?? {};
    });
  }

  Future<void> _markAsViewed(String storyId) async {
    final prefs = await SharedPreferences.getInstance();
    viewedStoryIds.add(storyId);
    await prefs.setStringList('viewed_stories', viewedStoryIds.toList());
    setState(() {});
  }

  void _onStoryTap(StoryModel story) async {
    await _markAsViewed(story.id);
    if (!mounted) return;
    showDialog(context: context, builder: (_) => StoriesDialog(story: story));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.stories.length,
        itemBuilder: (context, index) {
          final story = widget.stories[index];
          final isViewed = viewedStoryIds.contains(story.id);

          return StoriesItem(
            story: story,
            isViewed: isViewed,
            onTap: () => _onStoryTap(story),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
      ),
    );
  }
}
