import 'package:flutter/material.dart';
import '../models/note.dart';

class NotePage extends StatelessWidget {
  final Note note;
  final Function(int) onDelete; // Добавляем параметр для удаления заметки

  const NotePage({super.key, required this.note, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        title: const Center(child: Text('Приютик кошачих мемов')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              note.description,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.network(note.photo_id),
            ),
            const SizedBox(height: 60),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black38),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  ),
                  onPressed: () {
                    onDelete(note.id); // Вызываем функцию удаления
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Вы забрали мордашку!', style: TextStyle(fontSize: 24),),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: Text('Забрать мордашку', style: TextStyle(fontSize: 30, color: Colors.green[100]),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
