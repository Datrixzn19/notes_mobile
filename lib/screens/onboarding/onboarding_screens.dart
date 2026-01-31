import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int pageIndex = 0;

  void nextPage() {
    if (pageIndex < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() => pageIndex = index);
        },
        children: const [
          _OnboardingPage(
            title: 'Bienvenido',
            description: 'Aplicación con registro seguro de usuarios.',
          ),
          _OnboardingPage(
            title: 'Beneficios',
            description: 'Validaciones avanzadas y acceso protegido.',
          ),
          _OnboardingPage(
            title: 'Comenzar',
            description: 'Crea tu cuenta para continuar.',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/register');
              },
              child: const Text('Saltar'),
            ),
            ElevatedButton(
              onPressed: nextPage,
              child: Text(pageIndex == 2 ? 'Registrarse' : 'Siguiente'),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  const _OnboardingPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 16),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
