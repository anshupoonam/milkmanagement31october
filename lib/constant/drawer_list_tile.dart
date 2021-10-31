import 'package:flutter/material.dart';
import 'package:milkmanagement/constant/theme_service.dart';
import 'package:milkmanagement/pages/contact_us.dart';
import 'package:milkmanagement/pages/google_map.dart';
import 'package:milkmanagement/pages/image_upload.dart';
import 'package:milkmanagement/pages/item_list.dart';
import 'package:milkmanagement/pages/online_web.dart';
import 'package:milkmanagement/pages/setting.dart';
import 'package:milkmanagement/pages/signature.dart';
import 'package:milkmanagement/pages/sqlite_form.dart';
import 'package:get/get.dart';
import 'package:milkmanagement/pages/sqlite_view.dart';
import '../shared_service.dart';

// ignore: non_constant_identifier_names
Widget DrawerList(BuildContext context) {
  return ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text("Home"),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text("Settings"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingPage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.contact_support),
        title: const Text("Contact Us"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactUs()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text("Sqlite"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SqLiteSave()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text("Sqlite Data View"),
        onTap: () {
          Get.to(() => const SqliteView());
        },
      ),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text("Item List View"),
        onTap: () {
          Get.to(() => const ItemList());
        },
      ),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text("Google Map View"),
        onTap: () {
          Get.to(() => const GoogleMapData());
        },
      ),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text("PNR Status"),
        onTap: () {
          Get.to(() => const OnlineReports());
        },
      ),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text("Signature"),
        onTap: () {
          Get.to(() => const SignaturePage());
        },
      ),
      ListTile(
        leading: const Icon(Icons.save),
        title: const Text("Image Upload"),
        onTap: () {
          Get.to(() => const ImageUpload());
        },
      ),
      ListTile(
        leading: const Icon(Icons.power_settings_new),
        title: const Text("Log Out"),
        onTap: () {
          SharedService.logout().then(
            (_) => Navigator.of(context).pushReplacementNamed('/login'),
          );
        },
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                InkWell(
                    onTap: ThemeService().switchTheme,
                    child: Row(children: const <Widget>[
                      Icon(Icons.lightbulb),
                      Text("For Dark / Light Mode"),
                    ])),
                //Text("data"),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
