import 'package:flutter/material.dart';
import 'package:pcs3_sem5/models/note.dart';

class CreateNotePage extends StatefulWidget {
  final Function(Note) onCreate;

  const CreateNotePage({Key? key, required this.onCreate}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController(); // Новый контроллер для URL изображения

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать заметку'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Заголовок'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Описание'),
              maxLines: 4,
            ),
            TextField(
              controller: _imageUrlController, // Используем новый контроллер
              decoration: const InputDecoration(labelText: 'URL изображения'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Создаем новую заметку и возвращаемся на предыдущий экран
                final newNote = Note(
                  id: DateTime.now().millisecondsSinceEpoch, // Уникальный ID
                  photo_id: _imageUrlController.text, // Используем URL изображения
                  title: _titleController.text,
                  description: _descriptionController.text,
                    isLiked: false
                );
                widget.onCreate(newNote);
                Navigator.pop(context);
              },
              child: const Text('Сохранить заметку'),
            ),
          ],
        ),
      ),
    );
  }
}
