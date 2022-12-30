import 'package:todo_list/domain/model/task.dart';

abstract class TaskRepository {

  Future<List<Task>> getTasks();
  Future<Task> addTask(String title);
  Future<Task> completeTask(int id, bool completed);

}