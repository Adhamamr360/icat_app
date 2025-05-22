import 'package:flutter/material.dart';
import '../widgets/header_bar.dart';
import '../widgets/footer.dart';
import '../widgets/bullet_point.dart';
import '../widgets/expertise_card.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderBar(),
            _SecureSection(),
            SizedBox(height: 40),
            _ExpertiseSection(),
            SizedBox(height: 40),
            _ValueSection(),
            SizedBox(height: 40),
            _FoundationSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

// ───────────────────────────── Secure ──────────────────────────────
class _SecureSection extends StatelessWidget {
  const _SecureSection();

  @override
  Widget build(BuildContext context) => _ResponsiveRow(
    left: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Secure and Protect your business',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'Empower your team with the knowledge to defend against cyber threats. '
              'iCAT delivers adaptive awareness training through simulated attacks and assessments.',
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/test'),
          child: const Text('Try Free'),
        ),
      ],
    ),
    right: Image.asset('assets/images/Secure_illustration.png',
        fit: BoxFit.contain),
  );
}
// ────────────────────────── EXPERTISE ────────────────────────────
  class _ExpertiseSection extends StatelessWidget {
  const _ExpertiseSection();

  @override
  Widget build(BuildContext context) {
  return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24),
  child: Column(
  children: [
  Text('Equip your organization with cybersecurity expertise',
  textAlign: TextAlign.center,
  style: Theme.of(context).textTheme.titleLarge),
  const SizedBox(height: 8),
  const Text('iCAT suits everyone'),
  const SizedBox(height: 32),
  Wrap(
  alignment: WrapAlignment.center,
  spacing: 24,
  runSpacing: 24,
  children: const [
  ExpertiseCard(
  title: 'Corporations and Enterprises',
  desc: 'Advanced programs, simulations and assessments',
  ),
  ExpertiseCard(
  title: 'Small & Medium Businesses',
  desc: 'Cost-effective, focused security content',
  ),
  ExpertiseCard(
  title: 'Educational Institutions',
  desc: 'Engage students & staff with interactive lessons',
  ),
  ],
  ),
  ],
  ),
  );
  }
  }

// ─────────────────────────── VALUE ───────────────────────────────
  class _ValueSection extends StatelessWidget {
    const _ValueSection();

    @override
    Widget build(BuildContext context) =>
        _ResponsiveRow(
          left: Image.asset('assets/images/value_illustration.png',
              fit: BoxFit.contain),
          right: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'The Value of Empowering Your Team Against Cyber Threats',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              BulletPoint(
                  'Measurable progress through assessments and insights.'),
              BulletPoint(
                  'Gamified leaderboard boosts engagement and retention.'),
              BulletPoint(
                  'Adaptive content remains relevant for all skill levels.'),
              BulletPoint(
                  'Proactive security mindset lowers incident-response costs.'),
            ],
          ),
        );
  }
// ───────────────────────── FOUNDATION ───────────────────────────
  class _FoundationSection extends StatelessWidget {
    const _FoundationSection();

    @override
    Widget build(BuildContext context) =>
        _ResponsiveRow(
          left: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Building a strong foundation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                  'Protecting your organization starts with a solid awareness base. iCAT provides:'),
              SizedBox(height: 12),
              BulletPoint(
                  'Comprehensive modules covering phishing, social engineering and data protection.'),
              BulletPoint('Continuous updates to tackle emerging threats.'),
              BulletPoint('Accessible lessons to fit busy schedules.'),
            ],
          ),
          right: Image.asset('assets/images/foundation_illustration.png',
              fit: BoxFit.contain),
        );
  }
// ────────────────────── SHARED RESPONSIVE ROW ───────────────────
  class _ResponsiveRow extends StatelessWidget {
  final Widget left;
  final Widget right;
  const _ResponsiveRow({required this.left, required this.right});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
  builder: (ctx, constraints) {
  final mobile = constraints.maxWidth < 600;
  // Mobile: simple column (no Expanded)
  if (mobile) {
  return Padding(
  padding:
  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
  child: Column(children: [
  left,
  const SizedBox(height: 24),
  right,
  ]),
  );
  }
  // Desktop/tablet: row with Expanded children
  return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Expanded(child: left),
  const SizedBox(width: 24),
  Expanded(child: right),
  ],
  ),
  );
  },
  );
  }
