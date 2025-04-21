import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:steak_dream/features/loyalty_program/domain/entities/loyalty.dart';
import 'package:steak_dream/features/loyalty_program/domain/repositories/loyalty_repository.dart';
import 'package:steak_dream/features/loyalty_program/data/models/loyalty_model.dart';

class LoyaltyRepositoryImpl implements LoyaltyRepository {
  @override
  Future<Loyalty> getLoyaltyProgress() async {
    try {
      // Имитируем загрузку из API
      await Future.delayed(const Duration(milliseconds: 500));

      // Попытка загрузить данные из локального JSON-файла
      final jsonData = await rootBundle.loadString('assets/mock/loyalty.json');
      final Map<String, dynamic> parsed = jsonDecode(jsonData);
      return LoyaltyModel.fromJson(parsed);
    } catch (e) {
      // В случае ошибки — возвращаем объект с 0
      return const Loyalty(currentCount: 0, maxCount: 7);
    }
  }
}

