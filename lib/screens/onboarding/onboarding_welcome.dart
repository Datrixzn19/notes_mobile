import 'package:flutter/material.dart';
import '/services/api_service.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Películas Populares")),
      body: FutureBuilder(
        future: apiService.getRecursos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error al cargar datos"));
          }

          final movies = snapshot.data as List;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.network(movies[index]["imagen"]),
                  title: Text(movies[index]["titulo"]),
                  subtitle: Text(movies[index]["descripcion"]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
