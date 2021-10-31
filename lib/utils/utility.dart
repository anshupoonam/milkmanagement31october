import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utility {

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  

  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
  );
  
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );

}