import 'package:flutter/material.dart';

class UserRegisterPage extends StatelessWidget {
  const UserRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text("User-specific registration form here"),
            // Add user-specific TextFields...
          ],
        ),
      ),
    );
  }
}
