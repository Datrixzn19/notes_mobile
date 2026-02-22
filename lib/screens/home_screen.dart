import 'package:flutter/material.dart';
import '../services/api_service.dart';

/// Pantalla principal que muestra el listado de datos obtenidos de la API.
/// Utiliza un [FutureBuilder] para manejar los estados de carga y error.
class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultados API")),
      body: FutureBuilder(
        future: apiService.getRecursos(),
        builder: (context, snapshot) {
          // Estado: Cargando
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Estado: Error
          if (snapshot.hasError) {
            // Muestra el error técnico en pantalla para saber qué corregir
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Error: ${snapshot.error}",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          // Estado: Datos cargados exitosamente
          final items = snapshot.data as List;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.network(items[index]["imagen"]),
                  title: Text(items[index]["titulo"]),
                  subtitle: Text(items[index]["descripcion"]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
