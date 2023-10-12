// src/db/devolop_database.dart
import 'package:moor/moor.dart';

part 'devolop_database.g.dart';

@DataClassName('DevolopEntity')
class DevolopTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

/// List DevolopDao in daos
@UseMoor(tables: [DevolopTable], daos: [DevolopDao])
class DevolopDatabase extends _$DevolopDatabase {
  DevolopDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
