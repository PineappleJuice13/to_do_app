import 'package:flutter/material.dart';
import '../class/to_do.dart';

// Component displays the date and 
// percentage of task completed
class MyStatsCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final List<ToDo> allTasks;

  final bool showIncompletedTasks;
  final ValueChanged<bool> onFliterChange;

  // Parent must send the screens height and width
  const MyStatsCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.allTasks,
    required this.showIncompletedTasks,
    required this.onFliterChange
  });


  @override
  Widget build(BuildContext context) {
    // Get current date
    final DateTime date = DateTime.now();

    return SizedBox(
      height: screenHeight * 0.4,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // Display percentage of tasks completed
        Row(
          children: [
          Container(
            height: screenHeight * 0.2,
            width: screenWidth * 0.3,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text("Percent of Completed Task: \n${completedTaskPercent(allTasks).round()}%",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
              ),
            ),
          ),

        // Display current date
          Container(
            height: screenHeight * 0.2,
            width: screenWidth * 0.3,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text("Todays Date: \n${date.day} - ${date.month} - ${date.year}",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ], //Row children
      ),
      
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
            ),
              const Text("Show incomplete tasks only"),
            
            Switch(
              value: showIncompletedTasks,
              onChanged: onFliterChange,
            )
            
          ], // Row children
        ),
      ],
    ),
      
    );
  }
}
