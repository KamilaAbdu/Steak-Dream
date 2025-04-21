import '../entities/loyalty.dart';
import '../repositories/loyalty_repository.dart';

class GetLoyaltyProgress {
  final LoyaltyRepository repository;

  GetLoyaltyProgress(this.repository);

  Future<Loyalty> call() => repository.getLoyaltyProgress();
}
