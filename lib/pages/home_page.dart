import 'package:flutter/material.dart';
import 'package:pcs3_sem5/components/item_note.dart';

final List<String> titles = <String>['Муся', 'Пуся', 'Кися', 'Мыся', 'Вася', 'Тося', 'Куся', 'Дуся', 'Фыся', 'Грызя'];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Center(child: Text('Заметки'))),
      ),
      body:  ListView.builder(
          itemCount: titles.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemNote( title: titles[index],);
          }

      ),
    );
  }
}