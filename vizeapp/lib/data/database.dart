import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference the box
  final _myBox = Hive.box('mybox');

// run this method if this is first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Ödevlerini yap", false],
      ["Proje sunumlarını hazırla", false],
    ];
  }


  // load the data from database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }
  // update the database
  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}
