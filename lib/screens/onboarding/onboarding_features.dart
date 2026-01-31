import 'package:flutter/material.dart';

class OnboardingFeatures extends StatelessWidget {
  const OnboardingFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.privacy_tip, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Seguridad y privacidad',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Secret Notes valora tu privacidad. tus datos son procesados solo en tu dispositivo.\nNo recopilamos tus datos.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Atrás'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/onboarding-access');
                  },
                  child: const Text('Siguiente'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
