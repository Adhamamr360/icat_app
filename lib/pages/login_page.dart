import 'package:flutter/material.dart';
import '../main.dart' show authState;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            _field(label: 'Email', icon: Icons.email),
            const SizedBox(height: 16),
            _field(label: 'Password', icon: Icons.lock, isPassword: true),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                authState.value = true;                     // pretend login OK
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size.fromHeight(48)),
              child: const Text('Login'),
            )
          ]),
        ),
      ),
    );
  }

  static Widget _field(
          {required String label,
          required IconData icon,
          bool isPassword = false}) =>
      TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        obscureText: isPassword,
      );
}
