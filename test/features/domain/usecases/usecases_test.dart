import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tasks_app/features/data/models/error_model.dart';
import 'package:tasks_app/features/data/models/task_model.dart';
import 'package:tasks_app/features/domain/repositories/tasks_repo.dart';
import 'package:tasks_app/features/domain/usecases/add_task_usecase.dart';
import 'package:either_dart/either.dart';
import 'package:tasks_app/features/domain/usecases/complete_task_usecase.dart';

import 'usecases_test.mocks.dart';

@GenerateMocks([TasksRepo])
void main() {
  late AddTaskUseCase createTaskUseCase;
  late CompleteTaskUseCase completeTaskUseCase;
  late MockTasksRepo mockTasksRepo;

  setUp(() {
    mockTasksRepo = MockTasksRepo();
    createTaskUseCase = AddTaskUseCase(tasksRepo: mockTasksRepo);
    completeTaskUseCase = CompleteTaskUseCase(tasksRepo: mockTasksRepo);
    provideDummy<Either<Failure, TaskModel>>(Right(TaskModel()));
    provideDummy<Either<Failure, int>>(const Right(1));
    // provideDummy<Either<Failure, List<TaskModel>>>(const Right(<TaskModel>[]));
  });

  group("Test Create Task", () {
    test('should return a Failure if title is empty', () async {
      final result = await createTaskUseCase(TaskModel(title: ''));
      expect(result.isLeft, true);
      expect(result.left.errMessage, equals('Task title cannot be empty'));
    });

    test('should return a Failure if title is null', () async {
      final result = await createTaskUseCase(TaskModel(title: null));
      expect(result.isLeft, true);
      expect(result.left.errMessage, equals('Task title cannot be empty'));
    });

    test('should return the created TaskModel if title is valid', () async {
      final validTask =
          TaskModel(id: 5, title: 'Test Task', isCompleted: false);
      when(mockTasksRepo.createTask(validTask))
          .thenAnswer((_) async => Right(validTask));

      final result = await createTaskUseCase(validTask);
      expect(result.isRight, true);
      expect(result.right.title, equals(validTask.title));
      expect(result.right.isCompleted, equals(validTask.isCompleted));
      expect(result.right.id, equals(validTask.id));
    });
  });
  group("Test Complete Task", () {
   test('should return the number of affected rows on success', () async {
    final validTask = TaskModel(id: 1, title: 'Test Task',isCompleted: false);
    when(mockTasksRepo.completeTask(validTask)).thenAnswer((_) async => Right(1));

    final result = await completeTaskUseCase.call(validTask);
    expect(result.isRight, true);
    expect(result.right, equals(1));
  });
  });
}
