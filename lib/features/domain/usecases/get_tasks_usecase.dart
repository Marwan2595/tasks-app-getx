import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tasks_app/features/data/models/error_model.dart';
import 'package:tasks_app/features/data/models/task_model.dart';
import 'package:tasks_app/features/domain/repositories/tasks_repo.dart';

@injectable
class GetTasksUseCase {
  final TasksRepo tasksRepo;
  GetTasksUseCase({required this.tasksRepo});
  Future<Either<Failure, List<TaskModel>>> call() async {
    return await tasksRepo.getTasks();
  }
}
