import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('iCAT',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
          _FooterCol('Company', ['About', 'Careers', 'Press']),
          _FooterCol('Support', ['Help Center', 'Privacy', 'Legal']),
          _FooterCol('Stay up to date', ['Email subscription form here']),
        ]),
        const SizedBox(height: 24),
        const Divider(color: Colors.white30),
        const SizedBox(height: 8),
        const Text('© 2025 iCAT. All rights reserved.',
            style: TextStyle(color: Colors.white70)),
      ]),
    );
  }
}

class _FooterCol extends StatelessWidget {
  final String title;
  final List<String> items;
  const _FooterCol(this.title, this.items);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      ...items.map((e) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(e, style: const TextStyle(color: Colors.white70))))
    ]);
  }
}
