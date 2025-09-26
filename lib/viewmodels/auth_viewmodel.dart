import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  // Lógica de login con credenciales estáticas
  Future<bool> login(String username, String password) async {
    // Simula una llamada a una API o base de datos
    await Future.delayed(const Duration(seconds: 1));
    if (username.toLowerCase() == 'coche' && password == 'pass123') {
      _isAuthenticated = true;
      // Notifica a todos los widgets que están escuchando que el estado ha cambiado.
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
