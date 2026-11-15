import 'package:flutter/material.dart';
import 'package:to_do_app/screens/task_creation_screen.dart';
import '../class/to_do.dart';

// Widget displays the navigation bar 
class MyNavigationBar extends StatelessWidget {
  // Stores selected nav item here
  final int selectedIndex;
  // Function only accepts ToDo Object
  final Function(ToDo) onTaskCreation;

  // Constructor
  // Requires both values from the parent widget
  const MyNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTaskCreation,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      // Store current screen index
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) async {
        // User cannot navigate to screen theyre already on
        if (index == selectedIndex) {
          return;
        }

        // Navigate to the home screen
        if (index == 0) {
          // Instead of pushing pop
          // Pop goes back to previous screen
          Navigator.pop(context);
        }

      // Navigate to the task creation screen
        if (index == 1) {
          // The new task thats created in the creation screen 
          // is stored in newTask
          final ToDo? newTask = await Navigator.push<ToDo>(
            context,
            MaterialPageRoute(
              builder: (context) => const CreationScreen()
              )
          );

        // If the new task is created at it to list
          if (newTask != null) {
            onTaskCreation(newTask);
          }
        }
      },
      
     
      // Defining each screens icon and labels
      destinations: const [
        // Index 0
        NavigationDestination(
          icon: Icon(Icons.home), 
          label: "Home",
          ),

        // Index 1
        NavigationDestination(
          icon: Icon(Icons.add), 
          label: "Add Task"
          ),
          
      ],
    );
  }
}