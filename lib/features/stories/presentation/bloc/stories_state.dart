import 'package:steak_dream/features/stories/data/model/stories_model.dart';

abstract class StoriesState {}

class StoriesInitial extends StoriesState {}

class StoriesLoading extends StoriesState {}

class StoriesLoaded extends StoriesState {
  final List<StoryModel> stories;

  StoriesLoaded(this.stories);
}

class StoriesError extends StoriesState {
  final String message;

  StoriesError(this.message);
}
