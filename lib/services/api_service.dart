import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  //

  final String baseUrl =
      "http://10.0.2.2:3000/api/v1"; // IP especial para Emulador Android

  Future<List<dynamic>> getRecursos() async {
    final response = await http.get(
      Uri.parse("$baseUrl/recursos"),
      headers: {
        "Content-Type": "application/json",
        // Si tu backend pide la llave aquí, descomenta y pon tu clave:
        // "api-key": "PEGAR_TU_API_KEY_AQUI",
      },
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
