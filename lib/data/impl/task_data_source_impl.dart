import 'package:drift/drift.dart';
import 'package:todo_list/data/data_source/task_data_source.dart';
import 'package:todo_list/data/local/db/database.dart';
import 'package:todo_list/data/local/mapper/task_mapper.dart';
import 'package:todo_list/domain/model/task.dart';

class TaskDataSourceImpl extends TaskDataSource {
  TaskDataSourceImpl({required this.localDB});

  final Database localDB;

  @override
  Future<List<Task>> getTasks() async {
    final rows = await localDB.select(localDB.taskTable).get();
    return rows.map((row) => row.toTask()).toList();
  }

  @override
  Future<Task> addTask(String title) async {
    try {
      final task = await localDB
          .into(localDB.taskTable)
          .insertReturning(TaskTableCompanion.insert(title: title));
      return task.toTask();
    } on OutOfMemoryError {
      // Todo : map to specific error
      throw const OutOfMemoryError();
    }
  }

  @override
  Future<Task> completeTask(int id, bool completed) async {
    try {
      final selector = localDB.update(localDB.taskTable)
        ..where(
          (row) => row.id.equals(id),
        );
      final task = await selector.writeReturning(
        TaskTableCompanion(
          isCompleted: Value(completed ? 1 : 0),
        ),
      );
      return task.first.toTask();
    } on OutOfMemoryError {
      // Todo : map to specific error
      throw const OutOfMemoryError();
    }
  }
}
