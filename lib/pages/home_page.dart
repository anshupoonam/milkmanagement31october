import 'package:flutter/material.dart';

import 'package:milkmanagement/api/api_service.dart';
import 'package:milkmanagement/pages/drawer.dart';

class HomePAGE extends StatefulWidget {
  static const String route = '/';
  const HomePAGE({Key? key}) : super(key: key);

  @override
  _HomePAGEState createState() => _HomePAGEState();
}

class _HomePAGEState extends State<HomePAGE> {
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerCode(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("DASHBOARD"),
      ),
      body: Card(
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/diwali.gif'))),
          child: const Text(""),
        ),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 12.0),
      ),
    );
  }
}
