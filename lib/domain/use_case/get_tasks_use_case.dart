import 'package:todo_list/domain/model/task.dart';
import 'package:todo_list/domain/repository/task_repository.dart';

class GetTasksUseCase {

  GetTasksUseCase({required this.taskRepository});

  final TaskRepository taskRepository;

  Future<List<Task>> call() {
    return taskRepository.getTasks();
  }

}