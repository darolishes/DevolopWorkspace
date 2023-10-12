import 'package:get_it/get_it.dart';
import 'package:moor/moor.dart';

final GetIt injector = GetIt.instance;

void setupInjector(QueryExecutor executor) {
  injector.registerLazySingleton(() => DevelopDatabase(executor));
}
