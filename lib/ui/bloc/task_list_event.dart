
abstract class TaskListEvent {}

class Load extends TaskListEvent {}

class AddTask extends TaskListEvent {
  AddTask({required this.title});
  final String title;
}

class CompleteTask extends TaskListEvent {
  CompleteTask({required this.id});
  final int id;
}
