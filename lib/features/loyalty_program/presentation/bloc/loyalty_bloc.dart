import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_loyalty_progress.dart';
import 'loyalty_event.dart';
import 'loyalty_state.dart';

class LoyaltyBloc extends Bloc<LoyaltyEvent, LoyaltyState> {
  final GetLoyaltyProgress getLoyaltyProgress;

  LoyaltyBloc(this.getLoyaltyProgress) : super(LoyaltyInitial()) {
    on<LoadLoyaltyProgress>((event, emit) async {
      emit(LoyaltyLoading());
      try {
        final result = await getLoyaltyProgress();
        emit(LoyaltyLoaded(result));
      } catch (e) {
        emit(LoyaltyError('Ошибка загрузки данных'));
      }
    });
  }
}
