import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget FooterDrawer(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    color: Colors.deepPurpleAccent,
    width: 700,
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
      child: Text(
        'Version 1.0',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          letterSpacing: 1,
        ),
      ),
    ),
  );
}
