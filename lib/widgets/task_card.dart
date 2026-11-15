import 'package:flutter/material.dart';
import '../class/to_do.dart';


class MyTaskCard extends StatelessWidget {
  final ToDo newTask;
  final VoidCallback onRemove;
  final VoidCallback onCompletion;

  const MyTaskCard({
    super.key,
    required this.newTask,
    required this.onRemove,
    required this.onCompletion
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      // If task is completed
      color: newTask.isCompleted
      ? Colors.purple.shade100
      : Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            // Title and due date
            // Expanded takes up as much of the horizontal space
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title: ${newTask.title}"),

                Text(
                  "Due Date: ${newTask.dueDate.day} - "
                  "${newTask.dueDate.month} - "
                  "${newTask.dueDate.year}",
                ),
                
                // If text is to long ... appears
                Text("Description: ${newTask.description}",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
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
          IconButton(
              onPressed: onCompletion, 
              icon: Icon(Icons.check_box),
              tooltip: "Complete Task",
              
              ),

          // Remove Task
            IconButton(
              onPressed: onRemove, 
              icon: Icon(Icons.remove_circle),
              tooltip: ("Remove Task"),
            ),
          ],
        ),
      ),
    );
  }
}