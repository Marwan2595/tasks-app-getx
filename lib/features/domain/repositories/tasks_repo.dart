import 'package:either_dart/either.dart';
import 'package:tasks_app/features/data/models/error_model.dart';
import 'package:tasks_app/features/data/models/task_model.dart';

abstract class TasksRepo {
  Future<Either<Failure, List<TaskModel>>> getTasks();
  Future<Either<Failure, TaskModel>> createTask(TaskModel task);
  Future<Either<Failure, int>> completeTask(TaskModel task);
}
