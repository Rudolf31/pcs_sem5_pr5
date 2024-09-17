import 'package:flutter/material.dart';
import 'package:pcs3_sem5/pages/note_page.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.title});

  final String title;

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
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(child: Text(title,
                  style: const TextStyle(fontSize: 24, color: Colors.white),)),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(fontSize: 16, color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}