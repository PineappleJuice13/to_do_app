import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/navigation_bar.dart';
import 'package:to_do_app/widgets/stats_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Tracks currently selected nav item
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    // Will be used later to make elements reize according to screen size
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: 
        // Call Stats Card Widget
        MyStatsCard(
            screenWidth: screenWidth, 
            screenHeight: screenHeight
          ),

        bottomNavigationBar: 
        // Call Stats Card Widget
        MyNavigationBar(
          selectedIndex: selectedIndex,

          onNavSelected: (int index){
              setState(() {
                selectedIndex = index;
              });
            }
          ),
          
        ),
    );
  }
}
