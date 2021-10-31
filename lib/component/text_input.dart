import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
 String? textString;
  String ?yourParam;
  late Function(String) onSelectParam;
  TextInput({required Key key, required this.textString, required this.onSelectParam}) : super(key: key);

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Color(0xFF000000)),
      cursorColor: const Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(

        hintText:textString,
        hintStyle: const TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}