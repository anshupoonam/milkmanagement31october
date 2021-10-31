
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:milkmanagement/api/api_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'dart:convert';

class SignaturePreviewPage extends StatelessWidget {
  final Uint8List? signature;
  var color = Colors.red;
  var strokeWidth = 5.0;

  SignaturePreviewPage({
    Key? key,
    @required this.signature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text('Store Signature'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () async {
                //print('jjj');
                storeSignature(context);
                // uploadImage('image', File('assets/images/bird.png'));
                //uploadFile();
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Center(
          child: Image.memory(signature!, width: double.infinity),
        ),
      );

  Future storeSignature(BuildContext context) async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    final time = DateTime.now().toIso8601String().replaceAll('.', ':');
    final name = 'signature_$time.png';
    final result = await ImageGallerySaver.saveImage(signature!, name: name);
    var imgbyte = base64.encode(signature!);
    var _byteImage = const Base64Decoder().convert(imgbyte);
    var image = Image.memory(_byteImage);
    //Text(_byteImage.toString());
    print(image);
    final isSuccess = result['isSuccess'];
    //print(path);
    APIService as = APIService();
    as.uploadImage(image);

    if (isSuccess) {
      Navigator.pop(context);
      Get.snackbar(
        'Success',
        imgbyte,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.greenAccent,
        duration: const Duration(minutes: 5),
      );
    } else {
      Get.snackbar(
        'Failed',
        'Failed to save signature',
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
