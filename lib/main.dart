import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/role_selection_page.dart'; // This is now the first registration step
import 'pages/verify_otp_page.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/register':
            (context) => const RoleSelectionPage(), // Start from role selection
        '/verify-otp': (context) => const VerifyOtpPage(),
        // You can add more routes here for the different user registration pages
        // Example:
        // '/register/user': (context) => const UserRegisterPage(),
        // '/register/company': (context) => const CompanyRegisterPage(),
        // '/register/lecturer': (context) => const LecturerRegisterPage(),
      },
    );
  }
}
