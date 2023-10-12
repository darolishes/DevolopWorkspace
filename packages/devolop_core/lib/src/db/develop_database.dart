import 'package:moor/moor.dart';

@DataClassName('CoreTable')
class CoreTables extends Table {
  IntColumn get id => integer().autoIncrement()();
}

@UseMoor(tables: [CoreTables])
class DevelopDatabase extends _$DevelopDatabase {
  DevelopDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
