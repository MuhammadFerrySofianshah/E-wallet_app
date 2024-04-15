import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:fluttertoast/fluttertoast.dart';

/// Widget untuk Memuat Data
Widget wCircularProgres(context) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator(color: Colors.black87)
          : const CircularProgressIndicator(color: Colors.black87),
    ),
  );
}

/// Notifikasi
void wFluttertoast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG);
}

/// Navigator Push
Future<void> wPushTo(dynamic context, Widget widget) async {
  await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

/// Navigator pushReplacement
Future<void> wPushReplacementTo(dynamic context, Widget widget) async {
  await Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

/// SUBMIT
Widget wInputSubmit(context, String title, VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const StadiumBorder(),
      minimumSize: const Size(double.infinity, 45),
      backgroundColor: Theme.of(context).primaryColor,
    ),
    onPressed: onPressed,
    child: Text(title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
  );
}
