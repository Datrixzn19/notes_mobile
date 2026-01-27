import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  String role = 'Usuario';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: userController,
                decoration: const InputDecoration(labelText: 'Usuario'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: passController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              TextField(
                controller: confirmPassController,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: role,
                items: ['Usuario', 'Admin']
                    .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    role = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(error, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // VALIDACIONES
                  if (userController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passController.text.isEmpty ||
                      confirmPassController.text.isEmpty) {
                    setState(() {
                      error = 'Todos los campos son obligatorios';
                    });
                    return;
                  }

                  if (passController.text != confirmPassController.text) {
                    setState(() {
                      error = 'Las contraseñas no coinciden';
                    });
                    return;
                  }

                  // REGISTRO
                  AuthService.register(
                    userController.text,
                    emailController.text,
                    passController.text,
                    role,
                  );

                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
