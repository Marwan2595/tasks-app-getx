import 'package:get/get.dart';
import 'package:tasks_app/models/task_model.dart';

class TasksController extends GetxController {
  final tasks = <TaskModel>[
    TaskModel(title: "Task 1", isCompleted: false),
    TaskModel(title: "Task 2", isCompleted: false),
  ].obs;

  void addTask(TaskModel task) => tasks.add(task);
  void completeTask(int index) =>
      tasks[index].isCompleted = !tasks[index].isCompleted;
}
