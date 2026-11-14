import 'package:flutter/material.dart';
import '../class/to_do.dart';

// Component displays the date and 
// percentage of task completed
class MyStatsCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final List<ToDo> allTasks;

  // Parent must send the screens height and width
  const MyStatsCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.allTasks
  });


  @override
  Widget build(BuildContext context) {
    // Get current date
    final DateTime date = DateTime.now();

    return SizedBox(
      height: screenHeight * 0.4,
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // Display percentage of tasks completed
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
            child: Text("Percent of Completed Tasks - ${completedTaskPercent(allTasks).round()}",
            style: TextStyle(
              fontWeight: FontWeight.bold),
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
            child: Text("${date.day} - ${date.month} - ${date.year}",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            
          ),
        ],
      ),
    );
  }
}
