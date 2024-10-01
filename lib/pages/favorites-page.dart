import 'package:flutter/material.dart';
import 'package:pcs3_sem5/components/item_note.dart';
import 'package:pcs3_sem5/models/note.dart';
import 'package:pcs3_sem5/data/notes-list.dart';

class FavoritesPage extends StatefulWidget {

  const FavoritesPage({super.key});

  @override
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  var filteredNotes = notes.where((note) => note.isLiked).toList();


  @override
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
      body: filteredNotes.isEmpty
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
        itemCount: filteredNotes.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(filteredNotes[index].id.toString()),
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
              notes: filteredNotes[index],
              onDelete: (int id) {
                setState(() {
                  notes.removeWhere((note) => note.id == id);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
