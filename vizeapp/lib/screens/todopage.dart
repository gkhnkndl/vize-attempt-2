import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vizeapp/core/storage.dart';
import '../components/dialog_box.dart';
import '../components/todo_tile.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title:const Text("To Do"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Theme.of(context).colorScheme.background,
        onPressed: createNewTask,
        child: Icon(Icons.add, color:Theme.of(context).colorScheme.secondary,),
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
