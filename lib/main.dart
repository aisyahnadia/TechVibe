import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/role_selection_page.dart';
import 'pages/verify_otp_page.dart';
import 'welcome_page.dart';
import 'splash_screen.dart';

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
      home: const SplashScreen(),

      // ✅ Using onGenerateRoute for dynamic arguments support
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/welcome':
            return MaterialPageRoute(builder: (_) => const WelcomePage());

          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());

          case '/register':
            return MaterialPageRoute(builder: (_) => const RoleSelectionPage());

          case '/verify-otp':
            // ✅ Expect String argument 'role'
            if (settings.arguments is String) {
              final role = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => VerifyOtpPage(role: role),
              );
            } else {
              return _errorRoute('Invalid arguments for VerifyOtpPage');
            }

          default:
            return _errorRoute('Page not found');
        }
      },
    );
  }

  // ✅ Helper for error route (optional but cleaner)
  MaterialPageRoute _errorRoute(String message) {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(child: Text(message)),
          ),
    );
  }
}
