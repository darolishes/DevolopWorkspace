import '../models/devolop_model.dart';

/// DevolopService: Abstract class for services
///
/// This class is an abstract class for services.
/// It is used to create, read, update and delete entities.
abstract class DevolopService<T extends DevolopModel> {
  Future<T> create(T entity);
  Future<T> read(String id);
  Future<T> update(T entity);
  Future<void> delete(String id);
}
