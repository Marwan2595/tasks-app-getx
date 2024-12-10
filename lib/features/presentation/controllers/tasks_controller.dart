import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:tasks_app/config/utils.dart';
import 'package:tasks_app/features/data/models/error_model.dart';
import 'package:tasks_app/features/data/models/task_model.dart';
import 'package:tasks_app/features/domain/usecases/add_task_usecase.dart';
import 'package:tasks_app/features/domain/usecases/complete_task_usecase.dart';
import 'package:tasks_app/features/domain/usecases/get_tasks_usecase.dart';

@injectable
class TasksController extends GetxController {
  final tasks = <TaskModel>[].obs;
  final loadingTasks = true.obs;
  final newTask = TaskModel(title: "", isCompleted: false).obs;
  final GetTasksUseCase getTasksUseCase;
  final AddTaskUseCase createTaskUseCase;
  final CompleteTaskUseCase completeTaskUseCase;
  TasksController(
    this.getTasksUseCase,
    this.createTaskUseCase,
    this.completeTaskUseCase,
  ) {
    getAllTasks();
  }
  Future<void> addTask(TaskModel task) async {
    Either<Failure, TaskModel> createTaskResult =
        await createTaskUseCase.call(task);
    createTaskResult.fold((failure) {
      Utils.showSnackBar("Error Creating Task", failure.errMessage);
    }, (newTask) {
      tasks.add(newTask);
    });
  }

  Future<void> getAllTasks() async {
    Either<Failure, List<TaskModel>> getTasksResult =
        await getTasksUseCase.call();
    getTasksResult.fold((failure) {
      Utils.showSnackBar("Error Getting Tasks", failure.errMessage);
    }, (allTasks) {
      tasks.value = allTasks;
    });

    loadingTasks.value = false;
  }

  void completeTask(TaskModel task) async {
    Either<Failure, int> completeTaskResult =
        await completeTaskUseCase.call(task);
    completeTaskResult.fold(
      (failure) {
        Utils.showSnackBar("Error Completing Task", failure.errMessage);
      },
      (operationsNumber) {
        final index = tasks.indexWhere((t) => t.id == task.id);
        if (index != -1) {
          tasks[index] = task;
        }
      },
    );
  }
}
