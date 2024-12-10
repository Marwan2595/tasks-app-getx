import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tasks_app/features/data/datasources/local/tasks_local_datasource.dart';
import 'package:tasks_app/features/data/models/error_model.dart';
import 'package:tasks_app/features/data/models/task_model.dart';
import 'package:tasks_app/features/domain/repositories/tasks_repo.dart';

@Injectable(as: TasksRepo)
class TasksRepoImpl implements TasksRepo {
  final TasksLocalDatasource tasksLocalDatasource;

  TasksRepoImpl({required this.tasksLocalDatasource});

  @override
  Future<Either<Failure, TaskModel>> createTask(TaskModel task) async {
    try {
      var newTask = await tasksLocalDatasource.createTask(taskModel: task);
      return Right(newTask);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    try {
      var allTasks = await tasksLocalDatasource.getTasks();
      return Right(allTasks);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> completeTask(TaskModel task) async {
    try {
      var numberOfOperations =
          await tasksLocalDatasource.completeTask(taskModel: task);
      return Right(numberOfOperations);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
