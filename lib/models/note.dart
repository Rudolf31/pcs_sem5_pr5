import 'package:flutter/material.dart';

class Note {
  final int id;
  final String photo_id;
  final String title;
  final String description;
  bool isLiked;

  Note({
    required this.id,
    required this.photo_id,
    required this.title,
    required this.description,
    this.isLiked = false,
  });
}