import 'package:flutter/material.dart';
import 'package:pcs3_sem5/components/item_note.dart';
import 'package:pcs3_sem5/models/note.dart';
import 'create_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = <Note>[
    Note(
      id: 1,
      photo_id: 'https://media.tenor.com/nFR2LaDdGiAAAAAM/%D0%BA%D0%BE%D1%82-%D0%BC%D0%BE%D1%80%D0%B3%D0%B0%D0%B5%D1%82.gif',
      title: 'Муся',
      description: 'Муся не понимает, что тут происходит. Так ее и отдали в приют',
    ),
    Note(
      id: 2,
      photo_id: 'https://media1.tenor.com/m/o_5RQarGvJ0AAAAC/kiss.gif',
      title: 'Пуся',
      description: 'Пуся была слишком любвеобильна, ее нашли рядом с бездыханным зацмоканным телом предыдещих хoзяев',
    ),
    Note(
      id: 3,
      photo_id: 'https://opis-cdn.tinkoffjournal.ru/mercury/16-cats-mem.e0dmtgwc0lzv..gif',
      title: 'Кися',
      description: 'Кися разбрасывала свои комки шерсти буквально на всех поверхностях в доме. Это немного не устроило предыдущих владельцев',
    ),
    Note(
      id: 4,
      photo_id: 'https://media1.tenor.com/m/k_ECPZe7VIsAAAAd/cat-cat-driving-car.gif',
      title: 'Мыся',
      description: 'Мыся уже слишком взрослая для этого мира, однако ее отдали тк она разбила майбах владельца',
    ),
    Note(
      id: 5,
      photo_id: 'https://media1.tenor.com/m/H2h92fPVk0cAAAAd/cat-cat-violence.gif',
      title: 'Вася',
      description: 'Вася всего лишь хотел любви, но к сожалению она умела только шипеть((((((',
    ),
    Note(
      id: 6,
      photo_id: 'https://media1.tenor.com/m/5BYK-WS0__gAAAAd/cool-fun.gif',
      title: 'Тося',
      description: 'Тося тусила все ночи напролет, ее хозяева не спали 4 дня, пока она не оказалась в приюте',
    ),
    Note(
      id: 7,
      photo_id: 'https://media.tenor.com/CAyevOYHOr8AAAAM/cat-watermelon.gif',
      title: 'Куся',
      description: 'Куся опять хочет жрать, ее не смогла прокормить предыдущая семья, хотя скоро и приют не сможет',
    ),
    Note(
      id: 8,
      photo_id: 'https://media.tenor.com/8Cdx8fRXcUwAAAAM/cat-%D0%BA%D0%BE%D1%88%D0%BA%D0%B0.gif',
      title: 'Дуся',
      description: 'Дуся осуждает любого в поле своего зрения. Она осудила своего прошлого хозяина на 12 лет строгача.',
    ),
    Note(
      id: 9,
      photo_id: 'https://media.tenor.com/DM7SdBiQKhEAAAAM/cat-underwater.gif',
      title: 'Фыся',
      description: 'Муся очень хороший мем. Ее отдали в приют, тк она выпила домашний бассейн',
    ),
    Note(
      id: 10,
      photo_id: 'https://media.tenor.com/PGnGqfkIuLYAAAAM/cat-head.gif',
      title: 'Грызя',
      description: 'Грызя с рождения задается сложными вопросами. Однако над одним из них он по сей день ломает голову.. Что же появилось раньше, курица или яйцо?',
    ),
  ];

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
          crossAxisCount: 2, // Количество столбцов
          childAspectRatio: 0.5, // Соотношение сторон для элементов
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