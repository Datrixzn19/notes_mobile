//register_screen
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../providers/register_validators.dart';
import '../providers/email_check_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  String _role = 'Usuario';
  String _emailError = '';
  bool _checkingEmail = false;

  Future<void> _checkEmail() async {
    setState(() {
      _checkingEmail = true;
      _emailError = '';
    });

    bool exists = await EmailService.emailExiste(_emailCtrl.text);

    setState(() {
      _checkingEmail = false;
      if (exists) {
        _emailError = 'El correo ya está registrado';
      }
    });
  }

  void _submit() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    await _checkEmail();
    if (_emailError.isNotEmpty) return;

    AuthService.register(
      _nameCtrl.text,
      _emailCtrl.text,
      _passCtrl.text,
      _role,
    );

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nombres'),
                validator: RegisterValidators.required,
                textInputAction: TextInputAction.next,
              ),

              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: RegisterValidators.email,
                onChanged: (_) {
                  _emailError = '';
                },
              ),

              if (_checkingEmail)
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: LinearProgressIndicator(),
                ),

              if (_emailError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: const [
                      Icon(Icons.error, color: Colors.red, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'El correo ya está registrado',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 10),

              TextFormField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: RegisterValidators.password,
              ),

              TextFormField(
                controller: _confirmCtrl,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña',
                ),
                obscureText: true,
                validator: (value) =>
                    RegisterValidators.confirmPassword(value, _passCtrl.text),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                value: _role,
                decoration: const InputDecoration(labelText: 'Rol'),
                items: ['Usuario', 'Admin']
                    .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                    .toList(),
                onChanged: (value) {
                  _role = value!;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submit,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
