import 'package:flutter/material.dart';
import '../main.dart' show authState;      // simple global flag

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('iCAT',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

          // ­­­── NAV LINKS ­­­­­­­­­­­­­­­­­­
          Row(children: [
            ValueListenableBuilder<bool>(
              valueListenable: authState,
              builder: (_, loggedIn, __) => _NavBtn(
                label: 'Home',
                route: loggedIn ? '/dashboard' : '/landing',
              ),
            ),
            _NavBtn(label: 'Features', route: '/features'),
            _NavBtn(label: 'Pricing', route: '/pricing'),
            const SizedBox(width: 8),

            // ­­­── LOGIN / SIGN-OUT ­­­­­­­­­
            ValueListenableBuilder<bool>(
              valueListenable: authState,
              builder: (_, loggedIn, __) => ElevatedButton(
                onPressed: () {
                  if (loggedIn) {
                    // sign out
                    authState.value = false;
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/landing', (r) => false);
                  } else {
                    Navigator.pushNamed(context, '/login');
                  }
                },
                child: Text(loggedIn ? 'Sign out' : 'Login'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class _NavBtn extends StatelessWidget {
  final String label;
  final String route;
  const _NavBtn({required this.label, required this.route});

  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: () => Navigator.pushNamed(context, route), child: Text(label));
}
