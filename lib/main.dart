import 'package:ewallet_app/auth/register.dart';
import 'package:ewallet_app/auth/verify_email.dart';
import 'package:flutter/material.dart';

import 'auth/forgot_password.dart';
import 'auth/login.dart';
import 'splash/splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const VerifyEmail(),
    );
  }
}
