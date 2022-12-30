import 'package:todo_list/data/local/db/database.dart';
import 'package:todo_list/domain/model/task.dart';

extension TaskTableDataMapper on TaskTableData {
  Task toTask() {
    return Task(
      id: id,
      title: title,
      isCompleted: isCompleted == 1,
    );
  }
}
