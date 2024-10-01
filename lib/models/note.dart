import 'package:flutter/material.dart';

class Note {
  final int id;
  final String photo_id;
  final String title;
  final String description;
  bool isLiked; // Уберите final, чтобы сделать поле изменяемым

  Note({
    required this.id,
    required this.photo_id,
    required this.title,
    required this.description,
    this.isLiked = false, // Установите значение по умолчанию
  });
}