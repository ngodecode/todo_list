import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/use_case/complete_task_use_case.dart';
import 'package:todo_list/domain/use_case/get_tasks_use_case.dart';
import 'package:todo_list/domain/use_case/add_task_use_case.dart';
import 'package:todo_list/ui/bloc/task_list_event.dart';
import 'package:todo_list/ui/bloc/task_list_state.dart';


class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  TaskListBloc({
    required this.getTasksUseCase,
    required this.addTaskUseCase,
    required this.completeTaskUseCase,
  }) : super(TaskListState()) {
   on<Load>(_load);
   on<AddTask>(_addTask);
   on<CompleteTask>(_completeTask);
  }

  final GetTasksUseCase getTasksUseCase;
  final AddTaskUseCase addTaskUseCase;
  final CompleteTaskUseCase completeTaskUseCase;

  void _load(event, emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final tasks = await getTasksUseCase();
      emit(state.copyWith(isLoading: false, items: tasks));
    } on Exception {
      // Todo: handle exception
    } on Error {
      // Todo: handle error
    }
  }

  void _addTask(AddTask event, emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final task = await addTaskUseCase(
          title: event.title
      );
      emit(state.copyWith(isLoading: false, items: state.items?..add(task)));
    } on Exception {
      // Todo: handle exception
    } on Error {
      // Todo: handle error
    }
  }

  void _completeTask(CompleteTask event, emit) async {
    try {
      final task = await completeTaskUseCase(
          id: event.id
      );
      final items = state.items;
      if (items != null) {
        final index = items.indexWhere((item) => item.id == event.id);
        items[index] = task;
        emit(state.copyWith(isLoading: false, items: items));
      }
    } on Exception {
      // Todo: handle exception
    } on Error {
      // Todo: handle error
    }
  }

}
