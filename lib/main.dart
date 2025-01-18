import 'package:flutter/material.dart';
import 'package:urban_nest/view/login/login_view.dart';
import 'package:urban_nest/view/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
