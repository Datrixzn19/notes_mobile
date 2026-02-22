import 'dart:convert';
import 'package:http/http.dart' as http;

/// Servicio encargado de realizar peticiones HTTP a la API backend.
class ApiService {
  /// URL base del servidor.
  /// Se utiliza 10.0.2.2 para acceder al localhost de la PC desde el emulador Android.
  final String baseUrl =
      "http://10.0.2.2:3000/api/v1"; // IP especial para Emulador Android

  /// Obtiene la lista de recursos (películas, datos, etc.) desde el endpoint /recursos.
  ///
  /// Retorna una [List<dynamic>] con los datos si la petición es exitosa (200).
  /// Lanza una [Exception] si ocurre un error de conexión o del servidor.
  Future<List<dynamic>> getRecursos() async {
    final response = await http.get(
      Uri.parse("$baseUrl/recursos"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return data["data"];
    } else {
      // Muestra el código de error y el mensaje del servidor para poder corregirlo
      throw Exception("Error ${response.statusCode}: ${response.body}");
    }
  }
}
