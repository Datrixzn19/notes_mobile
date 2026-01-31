import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding/onboarding_welcome.dart';
import 'screens/onboarding/onboarding_features.dart';
import 'screens/onboarding/onboarding_access.dart';
import 'services/auth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingWelcome(),
        '/onboarding-features': (context) => const OnboardingFeatures(),
        '/onboarding-access': (context) => const OnboardingAccess(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) =>
            AuthService.isLoggedIn ? HomeScreen() : LoginScreen(),
      },
    );
  }
}
