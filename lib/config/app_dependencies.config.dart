// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/data/datasources/local/tasks_local_datasource.dart'
    as _i963;
import '../features/data/repositories/tasks_repo_impl.dart' as _i684;
import '../features/domain/repositories/tasks_repo.dart' as _i172;
import '../features/domain/usecases/add_task_usecase.dart' as _i35;
import '../features/domain/usecases/complete_task_usecase.dart' as _i978;
import '../features/domain/usecases/get_tasks_usecase.dart' as _i365;
import '../features/presentation/controllers/tasks_controller.dart' as _i891;
import 'tasksDatabase.dart' as _i912;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i912.TasksDatabase>(() => _i912.TasksDatabase());
    gh.factory<_i963.TasksLocalDatasource>(() => _i963.TasksLocalDatasourceImpl(
        tasksDatabase: gh<_i912.TasksDatabase>()));
    gh.factory<_i172.TasksRepo>(() => _i684.TasksRepoImpl(
        tasksLocalDatasource: gh<_i963.TasksLocalDatasource>()));
    gh.factory<_i35.AddTaskUseCase>(
        () => _i35.AddTaskUseCase(tasksRepo: gh<_i172.TasksRepo>()));
    gh.factory<_i978.CompleteTaskUseCase>(
        () => _i978.CompleteTaskUseCase(tasksRepo: gh<_i172.TasksRepo>()));
    gh.factory<_i365.GetTasksUseCase>(
        () => _i365.GetTasksUseCase(tasksRepo: gh<_i172.TasksRepo>()));
    gh.factory<_i891.TasksController>(() => _i891.TasksController(
          gh<_i365.GetTasksUseCase>(),
          gh<_i35.AddTaskUseCase>(),
          gh<_i978.CompleteTaskUseCase>(),
        ));
    return this;
  }
}
