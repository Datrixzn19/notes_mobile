import 'dart:async';

/// Servicio auxiliar para verificar la existencia de correos electrónicos.
class EmailService {
  // Simula correos ya registrados en la BD
  static final List<String> _emailsRegistrados = [
    'test@correo.com',
    'admin@correo.com',
  ];

  /// Simula una llamada asíncrona a base de datos para verificar si el email existe.
  static Future<bool> emailExiste(String email) async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    ); // debounce simulado
    return _emailsRegistrados.contains(email.toLowerCase());
  }
}
