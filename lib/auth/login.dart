
import 'package:ewallet_app/auth/register.dart';
import 'package:ewallet_app/home/home.dart';
import 'package:flutter/material.dart';

import '../widgets/widget.dart';
import '../widgets/widget_auth.dart';
import 'forgot_password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool _isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

// TEXT TITLE
  Widget _textTitle() {
    return wAuthTitle('Login', 'Enter Your Email and Password');
  }

// EMAIL
  Widget _inputEmail() {
    return TextFormField(
      controller: _email,
      decoration: const InputDecoration(hintText: "Email"),
    );
  }

// PASSWORD
  Widget _inputPassword() {
    return TextFormField(
      controller: _password,
      obscureText: _obscureText,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: _obscureText
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.black54,
                    size: 25.0,
                  )
                : const Icon(
                    Icons.visibility,
                    color: Colors.black54,
                    size: 25.0,
                  ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          hintText: "Password"),
    );
  }

// FORGOT PASSWORD
  Widget _forgotPassword() {
    return GestureDetector(
      onTap: () => wPushTo(context, const ForgotPassword()),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Text("Forgot Password",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }

// SUBMIT
  Widget _inputSubmit() {
    return wInputSubmit(context, "Login", _loginSementara);
  }

// GOOGLE SIGNIN
  Widget _googleSignIn() {
    return wGoogleSignIn(
      () {},
    );
  }

// TEXT LINK LOGIN
  Widget _textRegister() {
    return wTextLink(
      "Don't Have account yet ? ",
      "Sign Up",
      () => wPushReplacementTo(context, const Register()),
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
              body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _textTitle(),
                    _inputEmail(),
                    _inputPassword(),
                    _forgotPassword(),
                    _inputSubmit(),
                    wTextDivider(),
                    _googleSignIn(),
                    _textRegister(),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _loginSementara() async {
    if (_email.text == "123@gmail.com" && _password.text == "123") {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      wPushReplacementTo(context, const Home());
    } else {
      setState(() {
        _isLoading = false;
      });
      return wFluttertoast('Username atau Password salah');
    }
  }
}
