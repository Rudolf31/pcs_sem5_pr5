import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Center(child: Text('Заметки')),
      ),
      body: const Center(
        child: Text(
          'Здесь будет список заметок', style: TextStyle(fontSize: 16),),
      ),
    );
  }
}