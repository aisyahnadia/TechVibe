import 'package:flutter/material.dart';
// ignore: unused_import
import 'pages/login_page.dart';
import 'pages/register_page.dart' as register; // Assign a prefix
import 'welcome_page.dart';

void main() {
  runApp(const ProNetApp());
}

class ProNetApp extends StatelessWidget {
  const ProNetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProNet',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const WelcomePage(),
      routes: {'/register': (context) => const register.RegisterPage()},
    );
  }
}
