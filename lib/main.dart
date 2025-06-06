import 'package:flutter/material.dart';

// Public pages
import 'pages/signup_page.dart';
import 'pages/landing_page.dart';
import 'pages/features_page.dart';
import 'pages/pricing_page.dart';
import 'pages/login_page.dart';

// Auth‑protected pages
import 'pages/dashboard_page.dart';
import 'pages/test_trial_page.dart';
import 'pages/modules_page.dart';

/// Simple global auth flag for demo purposes.
/// In production, use Provider/BLoC/Firebase auth etc.
final ValueNotifier<bool> authState = ValueNotifier(false);

void main() => runApp(const ICatApp());

class ICatApp extends StatelessWidget {
  const ICatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: authState,
      builder: (context, isLoggedIn, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iCAT',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
          initialRoute: '/landing',
          routes: {
            // Public routes
            '/landing': (_) => const LandingPage(),
            '/features': (_) => const FeaturesPage(),
            '/pricing': (_) => const PricingPage(),
            '/login': (_) => const LoginPage(),
            '/signup': (_) => const SignupPage(),
            // Auth routes (can add guards here later)
            '/dashboard': (_) => isLoggedIn ? const DashboardPage() : const LoginPage(),
            '/test': (_) => isLoggedIn ? const TestTrialPage() : const LoginPage(),
            '/modules': (_) => isLoggedIn ? const ModulesPage() : const LoginPage(),
          },
        );
      },
    );
  }
}
