import 'package:steak_dream/features/loyalty_program/domain/entities/loyalty.dart';

class LoyaltyModel extends Loyalty {
  const LoyaltyModel({
    required super.currentCount,
    required super.maxCount,
  });

  factory LoyaltyModel.fromJson(Map<String, dynamic> json) {
    return LoyaltyModel(
      currentCount: json['currentCount'],
      maxCount: json['maxCount'],
    );
  }
}
