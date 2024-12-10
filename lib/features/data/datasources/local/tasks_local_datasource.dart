import 'package:injectable/injectable.dart';
import 'package:tasks_app/config/tasksDatabase.dart';
import 'package:tasks_app/features/data/models/task_model.dart';

abstract class TasksLocalDatasource {
  Future<TaskModel> createTask({required TaskModel taskModel});
  Future<int> completeTask({required TaskModel taskModel});
  Future<List<TaskModel>> getTasks();
}

@Injectable(as: TasksLocalDatasource)
class TasksLocalDatasourceImpl extends TasksLocalDatasource {
  TasksDatabase tasksDatabase;

  TasksLocalDatasourceImpl({required this.tasksDatabase});
  @override
  Future<TaskModel> createTask({required TaskModel taskModel}) async {
    TaskModel newTask = await tasksDatabase.createTask(taskModel);
    return newTask;
  }

  @override
  Future<int> completeTask({required TaskModel taskModel}) async {
    taskModel.isCompleted = !taskModel.isCompleted;
    int numberOfOperations = await tasksDatabase.updateTask(taskModel);
    return numberOfOperations;
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> allTasks = await tasksDatabase.getAllTasks();
    return allTasks;
  }
}
