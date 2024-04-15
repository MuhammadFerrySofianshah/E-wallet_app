import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Title dan subTitle
Widget wAuthTitle(String title, String subTitle) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(subTitle,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
        ],
      ),
    ),
  );
}

/// QR CONNECT WITH
Widget wTextDivider() {
  return const Row(
    children: [
      Expanded(child: Divider()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Text("OR CONNECT WITH",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal)),
      ),
      Expanded(child: Divider()),
    ],
  );
}

/// GOOGLE SIGNED IN
Widget wGoogleSignIn(VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 45),
      backgroundColor: Colors.grey,
      elevation: 0,
      shape: const StadiumBorder(),
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 3, right: 5),
            child: Icon(MdiIcons.google)),
        const Text("Google")
      ],
    ),
  );
}

/// DONT HAVE AKUN YET ? REGISTER
Widget wTextLink(String text, String title, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.only(top: 50),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal)),
        GestureDetector(
          onTap: onTap,
          child: Text(title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}
