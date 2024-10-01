import 'package:flutter/material.dart';
import '../models/note.dart';
import 'package:pcs3_sem5/data/notes-list.dart';

class NotePage extends StatefulWidget {
  final Note note;
  final Function(int) onDelete;

  const NotePage({super.key, required this.note, required this.onDelete});

  @override
  _NotePageState createState() => _NotePageState(mynote: note);
}

class _NotePageState extends State<NotePage> {
  final Note mynote;


  _NotePageState({required this.mynote});

  @override

  void toggleLike() {
    setState(() {
      mynote.isLiked = !mynote.isLiked;
      notes[widget.note.id - 1].isLiked = mynote.isLiked;
    });
  }

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.note.title,
                  style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    mynote.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: mynote.isLiked ? Colors.pink : Colors.grey,
                    size: 30,
                  ),
                  onPressed: toggleLike, // Обработчик нажатия
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.note.description,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.network(widget.note.photo_id),
            ),
            const SizedBox(height: 20),
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
                    widget.onDelete(widget.note.id);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Вы забрали мордашку!',
                          style: TextStyle(fontSize: 24),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: Text(
                    'Забрать мордашку',
                    style: TextStyle(fontSize: 30, color: Colors.green[100]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
