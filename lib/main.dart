import 'package:flutter/material.dart';
import 'package:session_7_flutter3/HomePage.dart';
import 'package:session_7_flutter3/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName:(context) => LoginPage(),
        HomePage.routeName:(context) => HomePage(),
      },
    );
  }
}