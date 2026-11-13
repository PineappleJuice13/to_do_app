import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/screens/task_creation_screen.dart';
import '../class/to_do.dart';

// Widget displays the navigation bar 
class MyNavigationBar extends StatelessWidget {
  // Stores selected nav item here
  final int selectedIndex;
  final Function(ToDo) onTaskCreation;

  // Callback function
  // Selecting different nav item
  // final Function(int) onNavSelected;

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
          // Pushes the new route and gets rid of the previous one
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => const HomeScreen()
            )
          );
        }

        if (index == 1) {
          final ToDo? newTask = await Navigator.push<ToDo>(
            context,
            MaterialPageRoute(
              builder: (context) => const CreationScreen()
              )
          );

          if (newTask != null) {
            onTaskCreation(newTask);
          }

          // Navigator.pushReplacement(
          //   context, 
          //   MaterialPageRoute(builder: (context) => CreationScreen()
          //   )
          // );
        }
      },
      
     
      // Defining each routes icon and labels
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