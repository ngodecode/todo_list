import 'package:todo_list/data/data_source/task_data_source.dart';
import 'package:todo_list/domain/model/task.dart';
import 'package:todo_list/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl({required this.dataSource});

  final TaskDataSource dataSource;

  @override
  Future<List<Task>> getTasks() async {
    return dataSource.getTasks();
  }

  @override
  Future<Task> addTask(String title) {
    return dataSource.addTask(title);
  }

  @override
  Future<Task> completeTask(int id, bool completed) {
    return dataSource.completeTask(id, completed);
  }

}
