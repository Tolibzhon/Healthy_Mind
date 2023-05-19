import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/auth/splash_screen.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      debugShowCheckedModeBanner: false,
      title: 'Helthy Mind',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      home: const SplashScreen(),
    );
  }
}
