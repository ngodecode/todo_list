import 'package:drift/drift.dart';
import 'package:drift/native.dart';


class TaskTable extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get isCompleted => integer().nullable()();

}