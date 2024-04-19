import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Yapılacaklar listesi database i deneme amaçlı hive ile yapıldı.
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
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

// boarding page gösterimi için uygulamaya ilk kez mi giriş yapılıyor kontrolü.
class Storage {
  Future<bool> isFirtsLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    var counter = storage.getInt("launchCount");


    if (runned == null) {
      counter = 1;
      await storage.setInt("launchCount", 1);
      return true;
    } else {      
      await storage.setInt("launchCount", counter! + 1);
      return false;
    }
  }

  firstLaunched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setBool("runned", true);
  }

  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }


  
}
