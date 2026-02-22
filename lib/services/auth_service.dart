//auth_service
class AuthService {
  static String? _user;
  static String? _email;
  static String? _password;
  static String? _role;
  static bool _isLoggedIn = false;

  // REGISTRO
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

  // LOGIN
  static bool login(String user, String password) {
    if (_user == user && _password == password) {
      _isLoggedIn = true;
      return true;
    }
    return false;
  }

  // LOGOUT
  static void logout() {
    _isLoggedIn = false;
  }

  static bool get isLoggedIn => _isLoggedIn;
  static String? get role => _role;
  static String? get email => _email;
}
