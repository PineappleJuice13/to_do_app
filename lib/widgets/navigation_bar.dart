import 'package:flutter/material.dart';

// Widget displays the navigation bar 
class MyNavigationBar extends StatelessWidget {
  // Stores selected nav item here
  final int selectedIndex;
  // Callback function
  // Selecting different nav item
  final Function(int) onNavSelected;

  // Constructor
  // Requires both values from the parent widget
  const MyNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onNavSelected
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onNavSelected,

      // Navigation options
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