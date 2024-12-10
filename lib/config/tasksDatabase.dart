import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../features/data/models/task_model.dart';

@lazySingleton
class TasksDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tasksDatabase.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database tasksDatabase, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';

    await tasksDatabase.execute('''
      CREATE TABLE $tableTasks ( 
        ${TaskFields.id} $idType, 
        ${TaskFields.title} $textType,
        ${TaskFields.isCompleted} $boolType
        )
      ''');
  }

  Future<TaskModel> createTask(TaskModel task) async {
    final tasksDatabase = await database;
    final id = await tasksDatabase.insert(tableTasks, task.toJson());
    return task.copy(id: id);
  }

  Future<List<TaskModel>> getAllTasks() async {
    final tasksDatabase = await database;

    const orderBy = '${TaskFields.id} ASC';

    final result = await tasksDatabase.query(tableTasks, orderBy: orderBy);

    return result.map((json) => TaskModel.fromJson(json)).toList();
  }

  // clearUserTable() async {
  //   Database db = await instance.database;
  //   return await db.rawDelete("DELETE FROM $tableTasks");
  // }

  Future<int> updateTask(TaskModel task) async {
    final tasksDatabase = await database;
    final id = await tasksDatabase.update(
      tableTasks,
      task.toJson(),
      where: '${TaskFields.id} = ?',
      whereArgs: [task.id],
    );
    return id;
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
