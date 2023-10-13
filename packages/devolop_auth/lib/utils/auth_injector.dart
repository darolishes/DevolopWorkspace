import '../abstract/auth_service.dart';
import '../services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

class AuthInjector {
  static final GetIt getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  }

  static AuthService getAuthService() {
    return getIt.get<AuthService>();
  }
}
