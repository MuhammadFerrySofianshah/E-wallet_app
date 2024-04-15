import 'package:flutter/material.dart';

import '../widgets/widget.dart';
import '../widgets/widget_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isLoading = false;
  final TextEditingController _email = TextEditingController();

  // EMAIL
  Widget _inputEmail() {
    return TextFormField(
      controller: _email,
      decoration: const InputDecoration(
          hintText: "Email", helperText: "Enter Your Email"),
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
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.black87),
              ),
              body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    wAuthTitle("Forgot Password",
                        "Enter Your Email and Well send Your a link \nto reset your Password"),
                    _inputEmail(),
                    const SizedBox(height: 30),
                    wInputSubmit(
                      context,
                      "Send",
                      _loginSementara,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void _loginSementara() async {
    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(const Duration(seconds: 2));
      return wFluttertoast(
          'Email Sended! Please check your email to reset Password.');
    } else {
      return wFluttertoast('Masukkan Email Anda.');
    }
  }
}
