import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_card.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/stats_card.dart';
import '../class/to_do.dart';


class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Tracks currently selected nav item
  int selectedIndex = 0;
  final List<ToDo> usersTasks = [];
  bool showIncompletedTasks = false;

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    // Will be used later to make elements reize according to screen size
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Creating a flitered list
    final displayTasks = showIncompletedTasks
    ? usersTasks.where((task) => !task.isCompleted).toList()
    : usersTasks;

  return Scaffold(
    appBar: AppBar(
    title: const Text("To Do List",
      style: TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),

      backgroundColor: const Color.fromARGB(255, 242, 171, 255),
    ),
    body: Column(
      children: [
      // Call Stats Card Widget
        MyStatsCard(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          allTasks: usersTasks,
          showIncompletedTasks: showIncompletedTasks,
          onFliterChange: (value) {
            setState(() {
              showIncompletedTasks = value;
            });
          },
        ),

      // List to display tasks
      // Expanded makes tasks scrollable
        Expanded(
          child: ListView.builder(
            itemCount: displayTasks.length,
            itemBuilder: (context, index) {
            final task = displayTasks[index];

              return MyTaskCard(
                newTask: task,
                onRemove: () {
                  setState(() {
                    usersTasks.remove(task);
                  });
                },
                onCompletion: () {
                  setState(() {
                    task.isCompleted = true;
                  });
                }
              );
            },
          ),
        ),
      ],
    ),

    // Bottom Navigation Bar
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: selectedIndex,
        onTaskCreation: (newTask) {
          setState(() {
            usersTasks.add(newTask);
          });
        },
      ),
    );
  }
}

        