import '../repository/task_repository.dart';
import '../model/task.dart';

class AddTaskUseCase {

  AddTaskUseCase({required this.taskRepository});

  final TaskRepository taskRepository;

  Future<Task> call({required String title}) async {
    return taskRepository.addTask(title);
  }
}