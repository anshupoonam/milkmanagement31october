import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkmanagement/pages/contact_us.dart';

Widget createDrawerHeader(BuildContext context) {
  return Column(
    children: [
      UserAccountsDrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
        ),
        accountName: const Text(
          'Developer Anshu',
          style: TextStyle(color: Colors.white),
        ),
        accountEmail: const Text(
          'anshucode@gmail.com',
          style: TextStyle(color: Colors.white),
        ),
        currentAccountPicture: CircleAvatar(
          child: ClipOval(
            child: GestureDetector(
              child: Image.asset(
                'assets/images/fruits.png',
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              ),
              onTap: () {
                Get.to(()=>const ContactUs());
              },
            ),
          ),
        ),
      ),
    ],
  );
}
