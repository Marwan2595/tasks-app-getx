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
    if (newTask.title == null || newTask.title!.isEmpty) {
      return const Left(Failure('Task title cannot be empty'));
    } else {
      return await tasksRepo.createTask(newTask);
    }
  }
}
