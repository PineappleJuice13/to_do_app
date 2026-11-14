class ToDo {
  String title;
  String description;
  DateTime dueDate;
  int mood; 
  bool isCompleted;

  // Constructor \\
  // Only certain arguments are required to create a todo object
  ToDo ({
    required this.title, 
    required this.description, 
    required this.dueDate, 
    required this.mood,
    required this.isCompleted
    });


  // Methods \\
  // GETTERS
  String get getTitle => title;
  String get getDesc => description;
  DateTime get getDueDate => dueDate;
  int get getMood => mood;

  // SETTERS
  set setTitle(String value) => title = value;
  set setDesc(String value) => description = value;
  set setDueDate(DateTime value) => dueDate = value;
  set setMood(int value) => mood = value;


}
  // Moved functions ouside Class so they can be called in other files
  // Function that calculates the percent of completed tasks
  double completedTaskPercent(List<ToDo> allTasks) {
    // Store the percent
    double percent = 0.0;
    // Fliters list
    // Stores a new list with all completed tasks
    int completedTasks = allTasks.where(
      (task) => task.isCompleted).length;
    
    if (allTasks.isEmpty) {
      return percent;
    }

    // Calculate percentage
    percent = (completedTasks / allTasks.length) * 100;
    
    return percent;
  }

