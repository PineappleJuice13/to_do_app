import 'package:flutter/material.dart';
import 'package:to_do_app/class/to_do.dart';
import '../widgets/navigation_bar.dart';

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

  DateTime selectedDueDate = DateTime.now();
  String errorMsg = "";


  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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

              // Spacing
              SizedBox(height: screenHeight * 0.02),

              // Row - Text and Slider
              Row(children: [
                Text("Mood: "),
                Expanded(child: 
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
                    // Displays moods
                    label: 
                    switch (newValue.round()) {
                      1 => "Happy",
                      2 => "Meh",
                      3 => "Sad",
                      4 => "Mad",
                      _ => "Unknown"
                    }
                  ),
                ),
              ],
            ),
                
              SizedBox(height: screenHeight * 0.02),

              // Due Date
                ElevatedButton(
                  // When the button is pressed open calendar
                  onPressed: () async {
                    // Wait for calendar to appear
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: selectedDueDate,
                      // Prevents user from selecting something in the past
                      firstDate: selectedDueDate,
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

              // Spacing
              SizedBox(height: screenHeight * 0.05),

              // Submit Button
                ElevatedButton(
                  onPressed: () {
                    // If task is empty do not create a ToDo Object
                      if (_titleController.text.isEmpty) {
                        setState(() {
                          errorMsg = "Title is empty.";
                        });
                      }

                      else {
                        // When button is pressed create task object
                        ToDo usersTask =                       
                        ToDo(
                          title: _titleController.text, 
                          description: _descController.text, 
                          dueDate: selectedDueDate,
                          mood: newValue.round(),
                          isCompleted: false
                        );

                      // Navigator goes back to previous scene (Always homescreen)
                      // New task is sent to Home screen
                      Navigator.pop(context, usersTask);
                    }

                  }, 
                  child: Text('Complete')
                ),

            // Adds space  
            SizedBox(height: screenHeight * 0.02),

            // When error msg is not empty show text
                if (errorMsg.isNotEmpty) 
                Text("Warning: ${errorMsg}",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.red
                  ),
                ),
              ]
            ),
          ),
        ),

    // Bottom Navigation Bar
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: 1,
        // Empty callback function is called
        onTaskCreation: (_) {},

      ),

      );
  }
}