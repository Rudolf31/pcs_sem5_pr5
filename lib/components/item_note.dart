import 'package:flutter/material.dart';
import 'package:pcs3_sem5/pages/note_page.dart';

import '../models/note.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.notes});
  final Note notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage())),
        child: Container(
          decoration: BoxDecoration(color: const Color.fromARGB(255, 23, 3, 49),
              borderRadius: BorderRadius.circular(16.0)),
          width: double.infinity,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(child: Text(notes.title,
                  style: const TextStyle(fontSize: 24, color: Colors.white),)),
                Text(
                  notes.description,
                  style: TextStyle(fontSize: 16, color: Colors.white),),
                SizedBox(height: 14,),
                Image(image: AssetImage(notes.photo_id), height: 200,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}