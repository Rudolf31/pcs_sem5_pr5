import 'package:flutter/material.dart';
import 'package:pcs3_sem5/components/item_note.dart';
import 'package:pcs3_sem5/models/note.dart';


final List<Note> notes = <Note>[
  Note (
    id: 1,
    photo_id: 'photo/cat_blinks.gif',
    title: 'Муся',
    description: 'Муся не понимает, что тут происходит. Так ее и отдали в приют',
  ),
  Note (
    id: 2,
    photo_id: 'photo/besito_catlove.gif',
    title: 'Пуся',
    description: 'Пуся была слишком любвеобильна, ее нашли рядом с бездыханным зацмоканным телом предыдещих хазяев',
  ),
  Note (
    id: 3,
    photo_id: 'photo/cat_doesnt_like.gif',
    title: 'Кися',
    description: 'Кися разбрасывала свои комки шерсти буквально на всех поверхностях в доме. Это немного не устроило предыдущих владельцев',
  ),
  Note (
    id: 4,
    photo_id: 'photo/cat_drives.gif',
    title: 'Мыся',
    description: 'Мыся уже слишком взрослая для этого мира, однако ее отдали тк она разбила майбах владельца',
  ),
  Note (
    id: 5,
    photo_id: 'photo/cat_hisses.gif',
    title: 'Вася',
    description: 'Вася всего лишь хотел любви, но к сожалению она умела только шипеть((((((',
  ),
  Note (
    id: 6,
    photo_id: 'photo/cat_is_enjoying.gif',
    title: 'Тося',
    description: 'Тося тусила все ночи напролет, ее хозяева не спали 4 дня, пока она не оказалась в приюте',
  ),
  Note (
    id: 7,
    photo_id: 'photo/cat_is_indignant.gif',
    title: 'Куся',
    description: 'Куся опять хочет жрать, ее не смогла прокормить предыдущая семья, хотя скоро и у прията не сможет',
  ),
  Note (
    id: 8,
    photo_id: 'photo/cat_judges.gif',
    title: 'Дуся',
    description: 'Дуся осуждает любого в поле своего зрения. Она осудила своего прошлого хозяина на 12 лет строгача.',
  ),
  Note (
    id: 9,
    photo_id: 'photo/cat_underwater.gif',
    title: 'Фыся',
    description: 'Муся очень хороший мем. Ее отдали в приют, тк она выпила домашний бассейн',
  ),
  Note (
    id: 10,
    photo_id: 'photo/cat_head.gif',
    title: 'Грызя',
    description: 'Грызя с рождения задается сложными для понимания вопросами. Однако над одним из них он по сей день ломает голову.. Так что же появилось раньше, курица или яйцо?',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        title: const Center(child: Text('Приютик кошачих мемов'), ),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemNote(notes: notes[index]);
          }
      ),
    );
  }
}