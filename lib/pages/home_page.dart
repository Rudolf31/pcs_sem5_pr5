import 'package:flutter/material.dart';
import 'package:pcs3_sem5/components/item_note.dart';
import 'package:pcs3_sem5/models/note.dart';
import 'create_note_page.dart';
import 'package:pcs3_sem5/data/notes-list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void _addNote(Note note) {
    setState(() {
      notes.add(note);
    });
  }


  void _removeNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        title: const Center(child: Text('Приютик кошачих мемов')),
      ),
      body: notes.isEmpty
          ? const Center(
        child: Text(
          'Мордашек не осталось',
          style: TextStyle(fontSize: 30),
        ),
      )
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
        ),
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(notes[index].id.toString()),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                'Иди погуляй',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onDismissed: (direction) {
              String noteTitle = notes[index].title;
              _removeNote(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Мем $noteTitle пошел прогуляться')),
              );
            },
            child: ItemNote(
              notes: notes[index],
              onDelete: (int id) {
                setState(() {
                  notes.removeWhere((note) => note.id == id);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNotePage(
                onCreate: (Note newNote) {
                  _addNote(newNote);
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Добавить заметку',
      ),
    );
  }
}