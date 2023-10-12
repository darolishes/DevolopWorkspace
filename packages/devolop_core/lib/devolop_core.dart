library devolop_core;

import 'package:flutter/widgets.dart';

export 'src/db/develop_database.dart';
export 'src/di/injector.dart';
export 'src/models/devolop_model.dart';
export 'src/services/devolop_service.dart';
export 'src/view_models/devolop_view_model.dart';

void initializeApp() {
  WidgetsFlutterBinding.ensureInitialized();
  // Further initialization logic
}
