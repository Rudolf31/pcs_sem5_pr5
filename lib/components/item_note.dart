import 'package:flutter/material.dart';
import 'package:pcs3_sem5/pages/note_page.dart';
import '../models/note.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.notes, required this.onDelete});

  final Note notes;
  final Function(int) onDelete; // Добавляем параметр для удаления заметки

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotePage(
              note: notes,
              onDelete: onDelete, // Передаем функцию удаления
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(205, 43, 63, 49),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.black45,
              width: 4.0,
            ),
          ),
          width: double.infinity,
          constraints: const BoxConstraints(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    notes.title,
                    style: const TextStyle(fontSize: 34, color: Colors.white),
                  ),
                ),
                Text(
                  notes.description,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 14),
                Image.network(
                  notes.photo_id,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Ошибка загрузки изображения'));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
