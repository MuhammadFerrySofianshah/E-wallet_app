import 'package:flutter/material.dart';

import 'package:ewallet_app/auth/login.dart';
import 'package:ewallet_app/home/home.dart';
import 'package:ewallet_app/widgets/widget.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkUserSementara(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wCircularProgres(context),
    );
  }

  void _checkUserSementara(bool? user) async {
    await Future.delayed(const Duration(seconds: 2));

    wPushReplacementTo(context ,user! ? const Home() : const Login());
  }
}
