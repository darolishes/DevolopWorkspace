import 'package:core/devolop_core.dart';

/// DevolopService: Abstract class for services
abstract class DevolopService<T extends DevolopModel> {
  /// Create a new entity
  Future<T> create(T entity);

  /// Read an entity by its ID
  Future<T> read(String id);

  /// Update an existing entity
  Future<T> update(T entity);

  /// Delete an entity by its ID
  Future<void> delete(String id);
}
