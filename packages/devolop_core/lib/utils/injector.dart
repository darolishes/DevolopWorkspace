import '../abstract/base_model.dart';
import '../services/generic_database.dart';

/// Dependency injection: Handles dependency resolution for services and databases.
///
/// This class should be used to retrieve instances of services and databases.
class Injector {
  final GenericDatabase<BaseModel> database;

  Injector({required this.database});
}
