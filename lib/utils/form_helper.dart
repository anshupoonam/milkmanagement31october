import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormHelper {
  static Widget inputFieldWidget(
    BuildContext context,
    Icon icon,
    String keyName,
    String labelName,
    Function onValidate,
    Function onSaved, {
    String initialValue = "",
    obscureText: false,
    required Widget suffixIcon,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        initialValue: initialValue,
        key: new Key(keyName),
        obscureText: obscureText,
        validator: (val) {
          return onValidate(val);
        },
        onSaved: (val) {
          return onSaved(val);
        },
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          hintText: labelName,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
            padding: EdgeInsets.only(left: 30, right: 10),
          ),
        ),
      ),
    );
  }

  static Widget picPicker(String fileName, Function onFilePicked) {
    Future<PickedFile>? _imageFile;
    ImagePicker _picker =  ImagePicker();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.image, size: 35.0),
                onPressed: () async {
                   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                  //_imageFile = _picker.getImage(source: ImageSource.gallery);
                 // _imageFile = _picker.pickImage(source: ImageSource.gallery);
             
                },
              ),
            ),
            SizedBox(
              height: 35.0,
              width: 35.0,
              child:  IconButton(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                icon: const Icon(Icons.camera, size: 35.0),
                onPressed: () {
                  // ignore: deprecated_member_use
                  _imageFile = _picker.getImage(source: ImageSource.camera) as Future<PickedFile>?;
                  _imageFile!.then((file) async {
                    onFilePicked(file);
                  });
                },
              ),
            ),
          ],
        ),
        fileName != null
            ? Image.file(
                File(fileName),
                width: 300,
                height: 300,
              )
            : new Container()
      ],
    );
  }

  static Widget saveButton(String buttonText, Function onTap) {
    return Container(
      height: 50.0,
      width: 150,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showMessage(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function onPressed,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(title),
          content:  Text(message),
          actions: [
             FlatButton(
              onPressed: () {
                return onPressed();
              },
              child:  Text(buttonText),
            )
          ],
        );
      },
    );
  }
}
