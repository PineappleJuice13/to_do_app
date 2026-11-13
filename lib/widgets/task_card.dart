import 'package:flutter/material.dart';
import '../class/to_do.dart';


class MyTaskCard extends StatelessWidget {
  final ToDo newTask;

  const MyTaskCard({
    super.key,
    required this.newTask
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            // Title and due date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title: ${newTask.title}"),

                Text(
                  "Due Date: ${newTask.dueDate.day} - "
                  "${newTask.dueDate.month} - "
                  "${newTask.dueDate.year}",
                ),
              ],
            ),

            // Mood emoji
            switch (newTask.mood) {
              1 => Image.asset(
                  'assets/happy_emoji.png',
                  height: 50,
                  width: 50,
                ),
              2 => Image.asset(
                  'assets/meh_emoji.png',
                  height: 50,
                  width: 50,
                ),
              3 => Image.asset(
                  'assets/sad_emoji.png',
                  height: 50,
                  width: 50,
                ),
              4 => Image.asset(
                  'assets/mad_emoji.png',
                  height: 50,
                  width: 50,
                ),
              _ => const SizedBox(),
            },

          // Complete Button 
          // Romves task from list
            // ElevatedButton(
            //   onPressed: onPressed, 
            //   child: child
            // )
          ],
        ),
      ),
    );
  }
}