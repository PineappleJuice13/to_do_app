import 'package:flutter/material.dart';

class MyCreationApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MyCreationApp> createState() => _MyCreationAppState();
}

class _MyCreationAppState extends State<MyCreationApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Creation",
          style: TextStyle(
            fontWeight: FontWeight.bold
            )
        ),

        backgroundColor: Colors.pink,
      )
    );
  }
}