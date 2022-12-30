import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/ui/bloc/task_list_bloc.dart';
import 'package:todo_list/ui/bloc/task_list_event.dart';
import 'package:todo_list/ui/bloc/task_list_state.dart';
import 'package:todo_list/ui/widget/task_item_card_widget.dart';
import 'package:todo_list/common/nullable_extensions.dart';

import '../../domain/model/task.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locator = GetIt.instance;
    return BlocProvider(
      create: (context) => locator.get<TaskListBloc>()..add(Load()),
      child: _TaskListView(),
    );
  }
}

class _TaskListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaskListViewState();
  }
}

class _TaskListViewState extends State<_TaskListView> {
  final TextEditingController _composerDialogTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: BlocBuilder<TaskListBloc, TaskListState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final items = state.items;
            if (items == null || items.isEmpty) {
              return _emptyWidget(context);
            } else {
              return _listWidget(context, items);
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showTaskComposerDialog(context),
      ),
    );
  }

  Widget _listWidget(BuildContext context, List<Task> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return TaskItemCardWidget(
          key: Key("item-$index"),
          title: item.title,
          isCompleted: item.isCompleted,
          onTap: () => _completeTask(context, item.id.orZero()),
        );
      },
    );
  }

  Widget _emptyWidget(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Lets create your first todo item"),
          ElevatedButton(
            onPressed: () => _showTaskComposerDialog(context),
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  void _showTaskComposerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add a new todo item"),
          content: TextField(
            controller: _composerDialogTextController,
            decoration: const InputDecoration(hintText: "Type your new todo"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addTask(
                  context,
                  _composerDialogTextController.text,
                );
                _composerDialogTextController.clear();
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _addTask(BuildContext context, String title) {
    context.read<TaskListBloc>().add(AddTask(title: title));
  }

  void _completeTask(BuildContext context, int id) {
    context.read<TaskListBloc>().add(CompleteTask(id: id));
  }
}
