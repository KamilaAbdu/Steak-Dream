import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/features/favorite/domain/usecases/get_favorites.dart';
import 'package:steak_dream/features/favorite/domain/usecases/toggle_favorite.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final ToggleFavorite toggleFavorite;
  final GetFavorites getFavorites;

  FavoriteBloc({
    required this.toggleFavorite,
    required this.getFavorites,
  }) : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  Future<void> _onLoadFavorites(
      LoadFavorites event, Emitter<FavoriteState> emit) async {
    try {
      final ids = await getFavorites();
      emit(FavoriteLoaded(ids: ids));
    } catch (_) {
      emit(const FavoriteError("Не удалось загрузить избранные товары"));
    }
  }

  Future<void> _onToggleFavorite(
      ToggleFavoriteEvent event, Emitter<FavoriteState> emit) async {
    if (state is FavoriteLoaded) {
      final currentState = state as FavoriteLoaded;

      try {
      
        await toggleFavorite(event.productId);

  
        final updatedIds = List<String>.from(currentState.ids);
        if (updatedIds.contains(event.productId)) {
          updatedIds.remove(event.productId);
        } else {
          updatedIds.add(event.productId);
        }

        emit(FavoriteLoaded(ids: updatedIds));
      } catch (_) {
        emit(const FavoriteError("Ошибка при изменении избранного"));
      }
    }
  }
}

