import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tasks_app/features/data/models/error_model.dart';
import 'package:tasks_app/features/data/models/task_model.dart';
import 'package:tasks_app/features/domain/repositories/tasks_repo.dart';

@injectable
class CompleteTaskUseCase {
  final TasksRepo tasksRepo;
  CompleteTaskUseCase({required this.tasksRepo});
  Future<Either<Failure, int>> call(TaskModel newTask) async {
    return await tasksRepo.completeTask(newTask);
  }
}
