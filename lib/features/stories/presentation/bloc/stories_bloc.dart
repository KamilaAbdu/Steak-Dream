import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/features/stories/data/model/stories_model.dart';
import 'stories_event.dart';
import 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoriesBloc() : super(StoriesInitial()) {
    on<FetchStories>((event, emit) async {
      emit(StoriesLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        final stories = List.generate(
          5,
          (index) => StoryModel(
            id: 'story_$index',
            title: 'Кешбек',
            imageUrl: '',
          ),
        );

        emit(StoriesLoaded(stories));
      } catch (_) {
        emit(StoriesError('Ошибка при загрузке сторисов'));
      }
    });
  }
}
