import 'package:flutter/material.dart';

class ExpertiseCard extends StatelessWidget {
  final String title, desc;
  const ExpertiseCard({required this.title, required this.desc, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Column(
        children: [
          const Icon(Icons.security, size: 48, color: Colors.blue),
          const SizedBox(height: 12),
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(desc,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
