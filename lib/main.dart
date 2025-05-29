import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/role_selection_page.dart';
import 'pages/verify_otp_page.dart';
import 'welcome_page.dart';
import 'splash_screen.dart';
import 'pages/home_page.dart';
import 'pages/apply_job.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProNet & Apply Job',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const SplashScreen(),

      // ✅ Use onGenerateRoute for handling dynamic route arguments
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/welcome':
            return MaterialPageRoute(builder: (_) => const WelcomePage());

          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());

          case '/register':
            return MaterialPageRoute(builder: (_) => const RoleSelectionPage());

          case '/verify-otp':
            // ✅ Expecting a Map with 'role'
            if (settings.arguments is Map) {
              final role = (settings.arguments as Map)['role'] as String;
              return MaterialPageRoute(
                builder: (_) => VerifyOtpPage(role: role),
              );
            } else {
              return _errorRoute('Invalid arguments for VerifyOtpPage');
            }

          case '/home':
            return MaterialPageRoute(builder: (_) => const HomePage());

          case '/apply-job':
            return MaterialPageRoute(builder: (_) => const ApplyJobScreen());

          default:
            return _errorRoute('Page not found');
        }
      },
    );
  }

  // ✅ Helper method for error page routing
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
