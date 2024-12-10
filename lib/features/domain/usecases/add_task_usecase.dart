import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tasks_app/features/data/models/error_model.dart';
import 'package:tasks_app/features/data/models/task_model.dart';
import 'package:tasks_app/features/domain/repositories/tasks_repo.dart';

@injectable
class AddTaskUseCase {
  final TasksRepo tasksRepo;
  AddTaskUseCase({required this.tasksRepo});
  Future<Either<Failure, TaskModel>> call(TaskModel newTask) async {
    return await tasksRepo.createTask(newTask);
  }
}
