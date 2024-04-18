import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vizeapp/data/database.dart';
import '../utility/dialog_box.dart';
import '../utility/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _HomePageState();
}

class _HomePageState extends State<ToDoPage> {

  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

@override
  void initState() {
    
    //if this is the first time ever opening the app than create default data
    if (_myBox.get("TODOLIST")== null){
      db.createInitialData();
    }
    else {
      //there already exist data
      db.loadData();
    }
    super.initState();
  }
  //text controller
final _controller = TextEditingController();


  // checkbox was tapped

  void checkBoxChanged(bool? value, int index) async {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();  
    db.updateDataBase();  
  }

  //createNewTask
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller:_controller ,
        onSave: saveNewTask,
        onCancel:() => Navigator.of(context).pop(),
      );
    });
  }
  // delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(179, 221, 221, 221),
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 117, 168, 255),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
