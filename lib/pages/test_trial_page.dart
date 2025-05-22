import 'package:flutter/material.dart';

class TestTrialPage extends StatefulWidget {
  const TestTrialPage({super.key});
  @override
  State<TestTrialPage> createState() => _TestTrialPageState();
}

class _TestTrialPageState extends State<TestTrialPage> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cybersecurity Awareness Test')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Question 1 of 10', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            const Text('Placeholder question pulled from backend',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 24),
            ...List.generate(
              4,
              (i) => RadioListTile<int>(
                value: i,
                groupValue: _selected,
                title: Text('Option ${i + 1}'),
                onChanged: (v) => setState(() => _selected = v!),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size.fromHeight(48)),
              child: const Text('Next', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
