// lib/main.dart
// Entry‑point & routes only. Pages and widgets live in lib/pages and lib/widgets
// -----------------------------------------------------------------------------
import 'package:flutter/material.dart';

// Public pages
import 'pages/landing_page.dart';
import 'pages/features_page.dart';
import 'pages/pricing_page.dart';
import 'pages/login_page.dart';

// Auth‑protected pages
import 'pages/dashboard_page.dart';
import 'pages/test_trial_page.dart';
import 'pages/modules_page.dart';

/// Simple global auth flag for demo purposes.
/// In production swap for Provider/BLoC/Firebase auth etc.
final ValueNotifier<bool> authState = ValueNotifier(false);

void main() => runApp(const ICatApp());

class ICatApp extends StatelessWidget {
  const ICatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iCAT',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      // Marketing landing is the first page
      initialRoute: '/landing',
      routes: {
        // Public routes
        '/landing': (_) => const LandingPage(),
        '/features': (_) => const FeaturesPage(),
        '/pricing': (_) => const PricingPage(),
        '/login': (_) => const LoginPage(),
        // Auth routes
        '/dashboard': (_) => const DashboardPage(),
        '/test': (_) => const TestTrialPage(),
        '/modules': (_) => const ModulesPage(),
      },
    );
  }
}
