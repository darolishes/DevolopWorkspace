import '../services/devolop_service.dart';

abstract class DevolopViewModel {
  DevolopService? service;

  void init(DevolopService service) {
    this.service = service;
  }

  void dispose() {
    service = null;
  }
}
