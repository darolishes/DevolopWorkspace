import 'package:moor/moor.dart';
import 'devolop_database.dart';

part 'devolop_dao.g.dart';

@UseDao(tables: [DevolopTable])
class DevolopDao extends DatabaseAccessor<DevolopDatabase>
    with _$DevolopDaoMixin {
  final DevolopDatabase db;

  // Constructor
  DevolopDao(this.db) : super(db);

  // CRUD Operations
  Future<int> insertDevolop(DevolopEntity devolop) =>
      into(devolopTable).insert(devolop);
  Future<List<DevolopEntity>> getAllDevolops() => select(devolopTable).get();
  Stream<List<DevolopEntity>> watchAllDevolops() =>
      select(devolopTable).watch();
  Future<bool> updateDevolop(DevolopEntity devolop) =>
      update(devolopTable).replace(devolop);
  Future<int> deleteDevolop(DevolopEntity devolop) =>
      delete(devolopTable).delete(devolop);

  // Batch Operations
  Future<void> batchInsertDevolops(List<DevolopEntity> devolops) {
    return batch((batch) {
      batch.insertAll(devolopTable, devolops);
    });
  }

  // Additional Queries
  Future<DevolopEntity?> getDevolopById(int id) {
    return (select(devolopTable)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // Get Devolops created after a certain date
  Future<List<DevolopEntity>> getDevolopsCreatedAfter(DateTime date) {
    return (select(devolopTable)
          ..where((tbl) => tbl.createdAt.isBiggerThanValue(date)))
        .get();
  }
}
