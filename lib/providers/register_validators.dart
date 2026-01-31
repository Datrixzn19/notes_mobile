class RegisterValidators {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese un correo';
    }
    if (!value.contains('@')) {
      return 'Correo inválido';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.length < 6) {
      return 'Mínimo 6 caracteres';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value != password) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }
}
