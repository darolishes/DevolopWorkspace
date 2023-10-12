// src/di/injector.dart
import 'package:get_it/get_it.dart';
import 'package:moor/moor.dart';
import '../db/devolop_database.dart';

final GetIt injector = GetIt.instance;

void setupInjector(QueryExecutor executor) {
  injector.registerLazySingleton(() => DevolopDatabase(executor));
}
