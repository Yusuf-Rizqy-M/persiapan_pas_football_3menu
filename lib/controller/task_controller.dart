import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/model_bola.dart';

class TaskController extends GetxController {
  static Database? _db;

  var tasks = <ModelBola>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            strTeam TEXT, 
            strStadium TEXT,
            strBadge TEXT, 
            strTeamShort TEXT, 
            strDescriptionEN TEXT, 
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  // Insert Task
  Future<int> addTask(ModelBola task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  // Retrieve Tasks
  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks
        .assignAll(queryResult.map((data) => ModelBola.fromMap(data)).toList());
  }
  void removeFavorite(ModelBola task) {
    tasks.remove(task);
  }

  bool isFavorite(ModelBola task) {
    return tasks.any((element) =>
    element.strTeam == task.strTeam &&
        element.strStadium == task.strStadium &&
        element.strBadge == task.strBadge);
  }

  void addFavorite(ModelBola task) {
    if (!tasks.contains(task)) {
      tasks.add(task);
    }
  }
  // Delete Task
  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }
}