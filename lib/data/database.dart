import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class ToDoDataBase{
  

  List toDoList = [];



  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method when the user opens the app for the very first time

  void createInitialData(){
    toDoList = [
      ["Sample tasks", false],
      ["Slide to delete a task", false],
    ];
  }

  // load the data from the database
  void loadData(){
    
    toDoList = _myBox.get("TODOLIST");


  }

  // update the database
  void updateData(){
    _myBox.put("TODOLIST", toDoList);

  }



}