import 'package:flutter/material.dart';

class EduRegisterPage extends StatelessWidget {
  const EduRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lecturer & Teacher Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text("Lecturer & Teacher-specific registration form here"),
          ],
        ),
      ),
    );
  }
}
