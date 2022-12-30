import '../repository/task_repository.dart';
import '../model/task.dart';

class CompleteTaskUseCase {

  CompleteTaskUseCase({required this.taskRepository});

  final TaskRepository taskRepository;

  Future<Task> call({required int id}) async {
    return taskRepository.completeTask(id, true);
  }
}