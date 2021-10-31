import 'package:url_launcher/url_launcher.dart';

launchURL() async {
  const url = 'https://www.youtube.com/';
  _launch(url);
}

launchEMAIL() async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'anshucode@gmail.com',
    queryParameters: {
      'subject': 'Testing URL_LAUNCHER | DEMO',
      'body': 'MESSAGE'
    },
  );
  _launch(_emailLaunchUri.toString());
}

launchCALL() async {
  const phonenumber = "tel:9050475010";
  _launch(phonenumber);
}

launchSMS() async {
  const smsPhoneNumber = "sms:9050475010";
  _launch(smsPhoneNumber);
}

launchWhatsapp() async {
   const url = "https://wa.me/?text=Hey buddy, try this super cool new app!";
   if (await canLaunch(url)) {
     await launch(url);
   } else {
   throw 'Could not launch $url';
  }
}

_launch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}