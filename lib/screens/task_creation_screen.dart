import 'package:flutter/material.dart';
import 'package:to_do_app/class/to_do.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/widgets/navigation_bar.dart';

class CreationScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  // Controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  // Variables for Slider
  // By default Slider starts at 2
  double currentValue = 2;
  double newValue = 1;

  // Private variables that store users input
  String _inputTitle = "";
  String _inputDesc = "";
  int _inputMood = 0;
  DateTime _inputDueDate = DateTime.now();
  // DateTime _inputStartDate = DateTime.now();

  DateTime selectedDueDate = DateTime.now();
  // DateTime selectedStartDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Task Creation",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.pink,
        ),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
              // Title
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Title:",
                    ),
                ),

              // Slider
                Slider(
                  value: newValue,
                  // When currentValue changes update new value
                  onChanged: (currentValue) {
                    setState(() => newValue = currentValue);
                  },
                  // Sets min and max values
                  min: 1,
                  max: 4,
                  divisions: 3,
                  // Prevents label from showing double
                  label: newValue.round().toString(),
                ),

              // Due Date
                ElevatedButton(
                  // When the button is pressed open calendar
                  onPressed: () async {
                    // Wait for calendar to appear
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: selectedDueDate,
                      firstDate: DateTime(2025),
                      lastDate: DateTime(3000),
                    );

                    // If calendar isn't null set state 
                      if (dateTime != null) {
                        setState(() {
                          selectedDueDate = dateTime;
                        });
                      }

                  }, 
                  // Button label
                  child: Text("Choose Due Date"),
                ),

                // Desc
                TextField(
                  controller: _descController,
                  // Able to use multiple lines
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Descrption",
                  ),
                ),

              // // Start Date
              //   ElevatedButton(
              //     onPressed: () async {
              //       final DateTime? dateTime2 = await showDatePicker(
              //         context: context,
              //         initialDate: selectedStartDate,
              //         firstDate: DateTime(2025),
              //         lastDate: DateTime(3000),
              //       );

              //         if (dateTime2 != null) {
              //           setState(() {
              //             selectedStartDate = dateTime2;
              //           });
              //         }

              //     }, 
              //     child: Text("Choose Start Date"),
              //   ),

              // Spacing
              SizedBox(height: screenHeight * 0.05),

              // Submit Button
                ElevatedButton(
                  // When button is submitted set these values
                  onPressed: () {
                    // When button is pressed create task object
                      ToDo usersTask =                       
                      ToDo(title: _inputTitle, 
                      description: _inputTitle, 
                      dueDate: _inputDueDate,
                      mood: _inputMood.round());

                    // New task is pushed to Home screen
                    //   Navigator.pushReplacement(
                    //   context, 
                    //   MaterialPageRoute(
                    //   builder: (context) => HomeScreen(
                    //   newTasks: usersTask,)
                    //   ),
                    // );
                    
                    setState(() {
                      _inputTitle = _titleController.text;
                      _inputDesc = _descController.text;
                      _inputMood = newValue.round();
                      _inputDueDate = selectedDueDate;
                      // _inputStartDate = selectedStartDate;

                    
                    });
                  }, 

                  child: Text('Complete')
                ),

                Text('Title Entered: $_inputTitle'),
                Text('Desc entered: $_inputDesc'),
                Text('Slider entered: $_inputMood'),
                Text('Due Date entered: $_inputDueDate'),
                // Text('Start Date enetered: $_inputStartDate'),

                // Text("${selectedDueDate.year} - ${selectedDueDate.month} - ${selectedDueDate.day}")
              ]
            ),
          ),
        ),

        bottomNavigationBar:
          MyNavigationBar(
            selectedIndex: 1
          ),
      ),
    );
  }
}