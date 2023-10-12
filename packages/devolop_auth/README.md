# Develop Auth Package

## Overview

This package provides authentication services for your Flutter application. It's built on top of Firebase Auth and uses the GetIt package for dependency injection.

## Features

- Email and Password based authentication
- Extensible base classes for further customization
- Error handling and logging
- Dependency injection via GetIt

## Directory Structure

```
lib/
|-- abstract/
|   |-- auth_service.dart
|
|-- models/
|   |-- user_model.dart
|
|-- services/
|   |-- firebase_auth_service.dart
|
|-- utils/
|   |-- auth_injector.dart
|
|-- develop_auth.dart
|-- constants.dart
```

## Usage

1. **Setup Dependency Injection**

```dart
void main() {
  AuthInjector.setup();
  runApp(MyApp());
}
```

2. **Using AuthService in your code**

```dart
final authService = AuthInjector.getAuthService();
```

3. **Sign In a User**

```dart
final user = await authService.signIn(email, password);
```

## Future Work

- Adding social sign-in methods (Google, Facebook, etc.)
- Adding two-factor authentication
- Support for password reset and email verification

## Contributing

Please read `CONTRIBUTING.md` for details on our code of conduct, and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the `LICENSE.md` file for details
