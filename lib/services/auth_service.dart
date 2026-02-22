/// Servicio de autenticación simulado.
/// Almacena las credenciales y el estado de sesión en memoria (RAM).
class AuthService {
  static String? _user;
  static String? _email;
  static String? _password;
  static String? _role;
  static bool _isLoggedIn = false;

  /// Registra un nuevo usuario guardando sus datos en variables estáticas.
  static void register(
    String user,
    String email,
    String password,
    String role,
  ) {
    _user = user;
    _email = email;
    _password = password;
    _role = role;
  }

  /// Verifica las credenciales para iniciar sesión.
  static bool login(String user, String password) {
    if (_user == user && _password == password) {
      _isLoggedIn = true;
      return true;
    }
    return false;
  }

  /// Cierra la sesión actual.
  static void logout() {
    _isLoggedIn = false;
  }

  static bool get isLoggedIn => _isLoggedIn;
  static String? get role => _role;
  static String? get email => _email;
}
