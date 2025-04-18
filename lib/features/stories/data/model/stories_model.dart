import 'package:flutter/material.dart';

class StoryModel {
  final String id;
  final String title;
  final String imageUrl;

  const StoryModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'] ?? UniqueKey().toString(), 
      title: json['title'] ?? 'Кешбеки',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
