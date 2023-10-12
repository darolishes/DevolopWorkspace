import 'base_model.dart';

/// BaseService abstract class: Interface for services that interact with entities.
///
/// This class should be extended to create specific CRUD services for different models.
abstract class BaseService<T extends BaseModel> {
  /// Creates a new entity.
  ///
  /// The implementation should handle the actual database operation.
  Future<T> create(T entity);

  /// Reads an entity by its ID.
  ///
  /// The implementation should handle the actual database operation.
  Future<T> read(String id);

  /// Updates an existing entity.
  ///
  /// The implementation should handle the actual database operation.
  Future<T> update(T entity);

  /// Deletes an entity by its ID.
  ///
  /// The implementation should handle the actual database operation.
  Future<void> delete(String id);

  /// Creates a new entity.
  Future<List<T>> batchCreate(List<T> entities) {
    throw UnimplementedError('batchCreate() is not implemented');
  }
}
