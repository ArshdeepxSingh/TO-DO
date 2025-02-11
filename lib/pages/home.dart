import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/Util/dialog_box.dart';
import 'package:todo/Util/to_do_tile.dart';
import 'package:todo/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();


  @override
  void initState() {
    // TODO: implement initState

    // if this is the first time ever opening the app create sample data
    if (_myBox.get("TODOLIST") == null) {

      // create some sample data

      db.createInitialData();
    }else{
      // load the data from the box
      db.loadData();

    }





    super.initState();
  }



  // text controller
  final _controller = TextEditingController();





  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([
        _controller.text,
        false
      ],

      
      );
      _controller.clear();
      
    }
    
    );
    Navigator.pop(context);
    db.updateData();

  }


  // create a new task
  void createNewTask() {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onCancel: () => Navigator.of(context).pop(),
        onSave: saveNewTask
      );
    } );
  }

  // delete a task 
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });

    db.updateData();



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 229, 223),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 16, 18),
        title: Text("TO-DO", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          shape: CircleBorder(),
          backgroundColor: Color.fromARGB(255, 17, 16, 18),
          child: Icon(Icons.add, color: Color.fromARGB(255, 233, 229, 223))),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            isCompleted: db.toDoList[index][1],
            onToggle: (value) => checkBoxChanged(value, index),
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}

extension on Future<Box> {
  get(String s) {}
}
