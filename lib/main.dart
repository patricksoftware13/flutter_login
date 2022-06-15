import 'package:flutter/material.dart';
import 'package:social_network_flutter/login.dart';
import 'package:social_network_flutter/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const LoginPage(), // SignUpPage
    );
  }
}
