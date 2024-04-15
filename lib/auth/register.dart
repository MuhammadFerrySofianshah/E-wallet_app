
import 'package:ewallet_app/auth/login.dart';
import 'package:flutter/material.dart';

import '../widgets/widget.dart';
import '../widgets/widget_auth.dart';
import 'verify_email.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

// TEXT TITLE
  Widget _textTitle() {
    return wAuthTitle('Register', 'Fill the form to tegister');
  }

// NAME
  Widget _inputName() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
          hintText: "Name", helperText: "Enter Full Name"),
    );
  }

// EMAIL
  Widget _inputEmail() {
    return TextFormField(
      controller: _email,
      decoration:
          const InputDecoration(hintText: "Email", helperText: "Enter Email"),
    );
  }

// PASSWORD
  Widget _inputPassword() {
    return Row(children: [
      Expanded(
        child: TextFormField(
          controller: _password,
          decoration: const InputDecoration(
              hintText: "******", helperText: "Enter Password"),
        ),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: TextFormField(
          controller: _passwordConfirm,
          decoration: const InputDecoration(
              hintText: "******", helperText: "Confirm Password"),
        ),
      ),
    ]);
  }

// SUBMIT
  Widget _inputSubmit() {
    return wInputSubmit(context, "Register", _RegisterSementara as VoidCallback);
  }

// GOOGLE SIGNIN
  Widget _googleSignIn() {
    return wGoogleSignIn(
      () {},
    );
  }

// TEXT LINK REGSITER
  Widget _textRegister() {
    return wTextLink(
      "Already Have account ? ",
      "Log in",
      () => wPushReplacementTo(context, const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Ketika diklik pada tab ksoong keboard akan hilang
      },
      child: _isLoading
          ? wCircularProgres(context)
          : Scaffold(
              resizeToAvoidBottomInset:
                  false, // Ketika keyboard muncul tidak berpengaruh dengan halaman
              body: SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      _textTitle(),
                      _inputName(),
                      _inputEmail(),
                      _inputPassword(),
                      const SizedBox(height: 30),
                      _inputSubmit(),
                      wTextDivider(),
                      _googleSignIn(),
                      _textRegister(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _RegisterSementara(context) async {
    
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    wPushReplacementTo(context, const Login());

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const VerifyEmail();
      },
    );
  }
}
