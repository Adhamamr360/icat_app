import 'package:flutter/material.dart';
import '../widgets/header_bar.dart';
import '../widgets/footer.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(children: const [
          HeaderBar(),
          Expanded(child: Center(child: Text('Features', style: TextStyle(fontSize: 32)))),
          FooterSection(),
        ]),
      );
}
