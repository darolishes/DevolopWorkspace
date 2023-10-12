import 'package:flutter/foundation.dart';

import 'base_model.dart';

/// BaseViewModel abstract class: A ViewModel base that works with BaseModel.
///
/// This class should be extended by any ViewModel that performs operations on models.
abstract class BaseViewModel<T extends BaseModel> extends ChangeNotifier {
  late T model;

  /// Initializes the ViewModel.
  ///
  /// This method is intended to perform any required setup operations.
  void initialize(T initialModel) {
    model = initialModel;
  }

  /// Updates the model and notifies all its listeners.
  ///
  /// This is a convenience method to update the model and refresh the UI.
  void updateModel(T updatedModel) {
    model = updatedModel;
    notifyListeners();
  }
}
