// devolop_core.dart
library devolop_core;

import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'src/di/injector.dart';

// Exports
export 'src/db/devolop_database.dart';
export 'src/di/injector.dart';
export 'src/models/devolop_model.dart';
export 'src/services/devolop_service.dart';
export 'src/view_models/devolop_view_model.dart';

// Initialization function
void initializeApp(QueryExecutor executor) {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector(executor);
}
