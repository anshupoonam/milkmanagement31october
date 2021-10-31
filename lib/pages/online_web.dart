import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class OnlineReports extends StatefulWidget {
  const OnlineReports({ Key? key }) : super(key: key);

  @override
  _OnlineReportsState createState() => _OnlineReportsState();
}

class _OnlineReportsState extends State<OnlineReports> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Check PNR Status'),
      ),
      body: const WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'http://www.indianrail.gov.in/enquiry/PNR/PnrEnquiry.html?locale=en',
       ),
    );
  }
}