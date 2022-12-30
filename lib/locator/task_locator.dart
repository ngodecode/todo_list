import 'package:get_it/get_it.dart';
import 'package:todo_list/data/data_source/task_data_source.dart';
import 'package:todo_list/data/impl/task_data_source_impl.dart';
import 'package:todo_list/data/impl/task_repository_impl.dart';
import 'package:todo_list/domain/repository/task_repository.dart';
import 'package:todo_list/domain/use_case/add_task_use_case.dart';
import 'package:todo_list/domain/use_case/complete_task_use_case.dart';
import 'package:todo_list/domain/use_case/get_tasks_use_case.dart';
import 'package:todo_list/ui/bloc/task_list_bloc.dart';

class TaskLocator {
  static void registerInto(GetIt getIt) {
    getIt.registerFactory<TaskDataSource>(() => TaskDataSourceImpl(localDB: getIt()));
    getIt.registerFactory<TaskRepository>(() => TaskRepositoryImpl(dataSource: getIt()));
    getIt.registerFactory(() => GetTasksUseCase(taskRepository: getIt()));
    getIt.registerFactory(() => AddTaskUseCase(taskRepository: getIt()));
    getIt.registerFactory(() => CompleteTaskUseCase(taskRepository: getIt()));
    getIt.registerFactory(
      () => TaskListBloc(
        getTasksUseCase: getIt(),
        addTaskUseCase: getIt(),
        completeTaskUseCase: getIt(),
      ),
    );
  }
}
