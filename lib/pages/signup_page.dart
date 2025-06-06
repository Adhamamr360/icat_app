import 'package:flutter/material.dart';
import '../main.dart' show authState;
import '../services/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final pass1Ctrl = TextEditingController();
  final pass2Ctrl = TextEditingController();
  String? _error;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final message = await AuthService.signUp(
      email: emailCtrl.text,
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      password1: pass1Ctrl.text,
      password2: pass2Ctrl.text,
    );

    if (message?.contains('success') ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful! Please login.')),
      );
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      setState(() => _error = message ?? 'Signup failed. Try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              _field(label: 'Email', controller: emailCtrl, icon: Icons.email),
              const SizedBox(height: 12),
              _field(label: 'First Name', controller: firstNameCtrl),
              const SizedBox(height: 12),
              _field(label: 'Last Name', controller: lastNameCtrl),
              const SizedBox(height: 12),
              _field(label: 'Password', controller: pass1Ctrl, isPassword: true),
              const SizedBox(height: 12),
              _field(label: 'Confirm Password', controller: pass2Ctrl, isPassword: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Create Account'),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(_error!, style: const TextStyle(color: Colors.red)),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _field({
    required String label,
    required TextEditingController controller,
    IconData? icon,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (val) => val == null || val.isEmpty ? 'Enter $label' : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
