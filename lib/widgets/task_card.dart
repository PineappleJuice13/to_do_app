import 'package:flutter/material.dart';
import '../class/to_do.dart';


class MyTaskCard extends StatelessWidget {
  // const new({super.key});

  final ToDo newTask;

  const MyTaskCard({
    super.key,
    required this.newTask
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
              Text(newTask.title),
              Text("${newTask.dueDate.year} - ${newTask.dueDate.month} - ${newTask.dueDate.day}",
              
              /*
              Tiny PNGs
                mood 1 - happy
                mood 2 - meh
                mood 3 - angry
                mood 4 - said
              */

            )
          ],
        ),
      ),

    );
  }
}