import 'package:flutter/material.dart';

class CompanyRegisterPage extends StatelessWidget {
  const CompanyRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Company Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [Text("Company-specific registration form here")],
        ),
      ),
    );
  }
}
