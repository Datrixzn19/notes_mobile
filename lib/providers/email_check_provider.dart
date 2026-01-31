import 'dart:async';

class EmailService {
  // Simula correos ya registrados en la BD
  static final List<String> _emailsRegistrados = [
    'test@correo.com',
    'admin@correo.com',
  ];

  static Future<bool> emailExiste(String email) async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    ); // debounce simulado
    return _emailsRegistrados.contains(email.toLowerCase());
  }
}
