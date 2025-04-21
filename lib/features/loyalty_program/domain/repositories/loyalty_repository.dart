import '../entities/loyalty.dart';

abstract class LoyaltyRepository {
  Future<Loyalty> getLoyaltyProgress();
}
