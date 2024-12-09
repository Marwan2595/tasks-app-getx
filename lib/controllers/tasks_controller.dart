import 'package:get/get.dart';
import 'package:tasks_app/models/task_model.dart';
import 'package:tasks_app/tasksDatabase.dart';

class TasksController extends GetxController {
  final tasks = <TaskModel>[].obs;
  final loadingTasks = true.obs;
  TasksController() {
    getAllTasks();
  }
  Future<void> addTask(TaskModel task) async {
    await TasksDatabase.instance.createTask(task);
    tasks.add(task);
  }

  Future<void> getAllTasks() async {
    tasks.value = await TasksDatabase.instance.getAllTasks();
    loadingTasks.value = false;
  }

  void completeTask(TaskModel task) async {
    task.isCompleted = !task.isCompleted;
    await TasksDatabase.instance.updateTask(task);
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
    }
  }
}
