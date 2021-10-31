import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class InternetService {
  static Future<bool> checkConnection() async{
 ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
  debugPrint(connectivityResult.toString());
if ((connectivityResult == ConnectivityResult.mobile) || (connectivityResult == ConnectivityResult.wifi)){
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }
}
