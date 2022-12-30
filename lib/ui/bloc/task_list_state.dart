import 'package:todo_list/domain/model/task.dart';

class TaskListState {
  TaskListState({
    this.items,
    this.isLoading,
  });

  final List<Task>? items;
  final bool? isLoading;

  TaskListState copyWith({
    List<Task>? items,
    bool? isLoading,
  }) {
    return TaskListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
