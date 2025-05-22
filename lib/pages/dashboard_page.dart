import 'package:flutter/material.dart';
import '../widgets/header_bar.dart';
import '../widgets/footer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const HeaderBar(),
        Expanded(
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/test'),
                  child: const Text('Take Test')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/modules'),
                  child: const Text('Browse Modules')),
            ]),
          ),
        ),
        const FooterSection(),
      ]),
    );
  }
}
