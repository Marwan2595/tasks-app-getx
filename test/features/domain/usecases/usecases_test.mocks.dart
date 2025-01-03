// Mocks generated by Mockito 5.4.4 from annotations
// in tasks_app/test/features/domain/usecases/usecases_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:either_dart/either.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:tasks_app/features/data/models/error_model.dart' as _i5;
import 'package:tasks_app/features/data/models/task_model.dart' as _i6;
import 'package:tasks_app/features/domain/repositories/tasks_repo.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [TasksRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockTasksRepo extends _i1.Mock implements _i2.TasksRepo {
  MockTasksRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Either<_i5.Failure, List<_i6.TaskModel>>> getTasks() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTasks,
          [],
        ),
        returnValue:
            _i3.Future<_i4.Either<_i5.Failure, List<_i6.TaskModel>>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, List<_i6.TaskModel>>>(
          this,
          Invocation.method(
            #getTasks,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, List<_i6.TaskModel>>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, _i6.TaskModel>> createTask(
          _i6.TaskModel? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTask,
          [task],
        ),
        returnValue: _i3.Future<_i4.Either<_i5.Failure, _i6.TaskModel>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, _i6.TaskModel>>(
          this,
          Invocation.method(
            #createTask,
            [task],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, _i6.TaskModel>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, int>> completeTask(_i6.TaskModel? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #completeTask,
          [task],
        ),
        returnValue: _i3.Future<_i4.Either<_i5.Failure, int>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, int>>(
          this,
          Invocation.method(
            #completeTask,
            [task],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, int>>);
}
