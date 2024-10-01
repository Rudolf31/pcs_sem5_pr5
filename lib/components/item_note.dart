import 'package:flutter/material.dart';
import 'package:pcs3_sem5/pages/note_page.dart';
import '../models/note.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.notes, required this.onDelete});

  final Note notes;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    const int maxDescriptionLength = 100; // Максимальная длина описания

    // Обрезаем текст описания, если он превышает максимальную длину
    String trimmedDescription = notes.description;
    if (trimmedDescription.length > maxDescriptionLength) {
      trimmedDescription = trimmedDescription.substring(0, maxDescriptionLength) + '...';
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotePage(
              note: notes,
              onDelete: onDelete,
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
                    style: const TextStyle(fontSize: 26, color: Colors.white),
                  ),
                ),
                Text(
                  notes.description,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
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
