import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_screen.dart';

void main() {
  runApp(const MyHomeApp());
}

// void main() {
//   runApp(const MaterialApp(title: 'Navigation Basics', home: FirstRoute()));
// }

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'To Do List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple
            ),
        ),

        // First screen displayed
        home: const HomeScreen(),
      );
  }
}
