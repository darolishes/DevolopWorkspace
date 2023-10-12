import '../abstract/auth_service.dart';
import '../services/firebase_auth_service.dart';

import 'package:get_it/get_it.dart';

/// A class that provides a static method to register dependencies.
class AuthInjector {
  static final GetIt getIt = GetIt.instance;

  /// Registers the [AuthService] as a singleton in the dependency injection container.
  static void setup() {
    getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  }

  static AuthService getAuthService() {
    return getIt.get<AuthService>();
  }

  // In AuthInjector.dart
  static Future<void> asyncSetup() async {
    await someAsyncInitialization();
    getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  }

  static Future<void> someAsyncInitialization() async {
    // Your async initialization code here.
  }
}
