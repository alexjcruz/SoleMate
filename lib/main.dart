import 'package:flutter/material.dart';
import 'package:solemate/screens/login.dart';
import 'package:solemate/screens/home.dart';
import 'package:solemate/screens/portfolio.dart';
import 'package:solemate/screens/settings.dart';

void main() {
  runApp(const SoleMateApp());
}

class SoleMateApp extends StatelessWidget {
  const SoleMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/portfolio': (context) => const Portfolio(),
        '/settings': (context) => const Settings(),
      },
    );
  }
}