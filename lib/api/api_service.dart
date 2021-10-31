import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:milkmanagement/api/end_point.dart';
import 'package:milkmanagement/model/item_details.dart';
import 'dart:convert';
import 'dart:async';
import 'package:milkmanagement/model/login_model.dart';
import 'package:milkmanagement/model/register_model.dart';
import 'package:get/get.dart';

class APIService {
  late File _image;
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse(EndPoint.loginUrl);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(url,
        body: jsonEncode(requestModel.toJson()), headers: requestHeaders);

    //  print('Response status: ${response.statusCode}');
    //print('Response body: ${requestModel.toJson()}');
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else if (response.statusCode == 401) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<RegisterResponseModel> register(
      RegisterRequestModel requestModel) async {
    var url = Uri.parse(EndPoint.registerUrl);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    //print('Register Response body: ${requestModel.toJson()}');
    final response = await http.post(url,
        body: jsonEncode(requestModel.toJson()), headers: requestHeaders);

    //print('Response status: ${response.statusCode}');
    //print('Response body: ${requestModel.toJson()}');
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else if (response.statusCode == 401) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<List<Data>> getItemList() async {
    Map<String, String> requestHeader = {
      'content-type': 'application/json',
      'authorization': 'Bearer ' + EndPoint.erpToken,
      'server': 'Microsoft-IIS/10.0',
    };
    var urlItem = Uri.parse(EndPoint.itemAllUrl);
    final response = await http.get(urlItem, headers: requestHeader);
    //debugPrint('response-------- ${response.body}');
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      // debugPrint('Again-------------------- ');
      List<Data> values = List<Data>.from(map['data'].map((data) {
        return Data.fromJson(data);
      }));
      return values;
    } else {
      throw Exception('Failed to load data');
    }
  }

  //static String apiURL = EndPoint.documentUpload;

  Future<dynamic> uploadImage(filePath) async {
    String url = EndPoint.documentUpload;
    final postUri = Uri.parse(url);
    http.MultipartRequest request = http.MultipartRequest('POST', postUri);
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'document', filePath.path.toString()); //returns a Future<MultipartFile>
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.snackbar("Image", "Upload SuccessFully",
      snackPosition:SnackPosition.BOTTOM,backgroundColor: Colors.deepPurpleAccent);
    } else {
     Get.snackbar("Image", "Upload Failed Try Again");
    }
    //return response.statusCode == 200 ? true : false;
  }
}
