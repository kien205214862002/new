import 'package:familiar_stranger_v2/config/themes/theme.dart';
import 'package:familiar_stranger_v2/ui/screens/home/mainscreen.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Familiar Stranger',
      theme: AppTheme.light,
      home: const MainScreen(),
      // home: const WelcomeScreen(),
    );
  }
}