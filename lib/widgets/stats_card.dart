import 'package:flutter/material.dart';

// Component displays the date and 
// percentage of task completed
class MyStatsCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  // Parent must send the screens height and width
  const MyStatsCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight
  });


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("To Do List",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),

          backgroundColor: const Color.fromARGB(255, 242, 171, 255),
        ),
        
        // Percent and Date
          body: SizedBox(
            height: screenHeight * 0.4,
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Text("Percent of Completed Tasks"),                ),

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
                    child: Text("Current Date"),
                    
                  ),
              ],
            ),
          ),
        ),
    );
  }
}
