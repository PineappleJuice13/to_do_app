class ToDo {
  String title;
  String description;
  DateTime dueDate;
  DateTime? startDate;
  int? mood; 

  // Constructor \\
  // Only certain arguments are required to create a todo object
  ToDo ({
    required this.title, 
    required this.description, 
    required this.dueDate, 
    this.startDate, 
    this.mood
    });


  // Methods \\
  // GETTERS
  String get getTitle => title;
  String get getDesc => description;
  DateTime get getDueDate => dueDate;
  DateTime? get getStartDate => startDate;
  int? get getMood => mood;

  // SETTERS
  set setTitle(String value) => title = value;
  set setDesc(String value) => description = value;
  set setDueDate(DateTime value) => dueDate = value;
  set setStartDate(DateTime value) => startDate = value;
  set setMood(int value) => mood = value;
}

