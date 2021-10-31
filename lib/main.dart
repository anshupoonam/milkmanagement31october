import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:milkmanagement/pages/home_page.dart';
import 'package:milkmanagement/pages/login_page.dart';
import 'package:milkmanagement/shared_service.dart';
import 'package:milkmanagement/utils/utility.dart';
import 'constant/theme_service.dart';

Widget _defaultHome = const LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var isLoggedIn = await SharedService.isLoggedIn();
  //var isgetXLoggedIn = await GetStorage.isLoggedIn();
  await GetStorage.init();
  //debugPrint("xxxx$isLoggedIn");
  if (isLoggedIn == true) {
    _defaultHome = const HomePAGE();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //change Material App to Get Material App.
       theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        // accentColor: Colors.deepPurpleAccent,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.redAccent,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
      ),
      title: 'Milk Management',
      
      //theme: Utility.light,
      darkTheme: Utility.dark,
      themeMode: ThemeService().theme,
       
      //themeMode: EasyDynamicTheme.of(context).themeMode,

      debugShowCheckedModeBanner: false,
      home: _defaultHome,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomePAGE(),
        '/login': (BuildContext context) => const LoginPage(),
      },
    );
  }
}

