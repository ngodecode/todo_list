
import 'package:get_it/get_it.dart';
import 'package:todo_list/data/local/db/database.dart';

class DBLocator {

  static void registerInto(GetIt getIt) {
    getIt.registerLazySingleton(() => Database());
  }

}