import 'package:flutter/material.dart';
import 'package:milkmanagement/services/launch_service.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            const SizedBox(
              height: 250,
              width: double.infinity,
              child: Image(
                image: AssetImage(
                  "assets/images/green.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 200, 15, 15),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 95),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    "Developer Anshu",
                                    //style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Full Stack Developer"),
                                    //subtitle: Text("Java,Dart,Flutter,Jquery,bootstrap"),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "5",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Projects Done"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Running Projects"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: const <Widget>[
                                      Text(
                                        "0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("UpComing"),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.15),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/juice.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: const <Widget>[
                        ListTile(
                          title: Text("Developer Info"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text("anshucode@gmail.com"),
                          leading: FloatingActionButton(
                            heroTag: "btn1",
                            mini: true,
                            onPressed: launchEMAIL,
                            child: Icon(Icons.email),
                          ),
                        ),
                        ListTile(
                          title: Text("Phone No"),
                          subtitle: Text("9050475010"),
                          leading: FloatingActionButton(
                             heroTag: "btn2",
                            mini: true,
                            onPressed: launchCALL,
                            child: Icon(Icons.phone),
                          ),
                        ),
                         ListTile(
                          title: Text("Whatsapp No"),
                          subtitle: Text("9050475010"),
                          leading: FloatingActionButton(
                             heroTag: "btn4",
                            mini: true,
                            onPressed: launchWhatsapp,
                            child: Icon(Icons.whatshot),
                          ),
                        ),
                        ListTile(
                          title: Text("Instagram"),
                          subtitle:
                              Text("https://Instagram.com/developeranshu"),
                          leading: FloatingActionButton(
                             heroTag: "btn3",
                            mini: true,
                            onPressed: launchURL,
                            child: Icon(Icons.link),
                          ),
                        ),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text(
                              "We hope you you are happy .\nSoftware developers are the creative minds behind software programs, \nand they have the technical skills to build those programs or to oversee\n their creation by a team"),
                          leading: Icon(Icons.format_align_center),
                        ),
                        ListTile(
                          title: Text("Joined Date"),
                          subtitle: Text("01 january 2017"),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildRaisedButton(String text, dynamic event) {
  return ElevatedButton(
    onPressed: event,
    child: Text(text),
  );
}
