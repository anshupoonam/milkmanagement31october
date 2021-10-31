import 'package:flutter/material.dart';
import 'package:milkmanagement/model/contact.dart';
import 'package:milkmanagement/pages/sqlite_view.dart';
import 'package:milkmanagement/utils/database_helper.dart';

class SqLiteSave extends StatefulWidget {
  const SqLiteSave({Key? key}) : super(key: key);

  @override
  _SqLiteSaveState createState() => _SqLiteSaveState();
}

class _SqLiteSaveState extends State<SqLiteSave> {
  late DatabaseHandler handler;
  final scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;
  Contact? contactRequestModel;

  @override
  void initState() {
    super.initState();
    contactRequestModel = Contact();
    handler = DatabaseHandler();
    // handler.initializeDB().whenComplete(() async {
    //   await addUsers();
    //   setState(() {});
    // }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Contact Save"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 20)
                    ]),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: contactRequestModel!.name,
                          onSaved: (input) => contactRequestModel!.name = input,
                          validator: (input) =>
                              input!.isEmpty ? "Please Enter Name" : null,
                          decoration: const InputDecoration(
                            hintText: "Name",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.pinkAccent,
                            ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: contactRequestModel!.country,
                          onSaved: (input) =>
                              contactRequestModel!.country = input,
                          validator: (input) =>
                              input!.isEmpty ? "Please Enter Country" : null,
                          decoration: const InputDecoration(
                            hintText: "Country Name",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.pinkAccent,
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          if (validateAndSave()) {
                            //print('Register body: ${contactRequestModel!.name}');
                            // print('Register body: ${contactRequestModel!.country}');
                            addUsers();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SqliteView()),
                            );
                          }
                        },
                        child: const Text(
                          "Save Contact",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: const Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SqliteView()),
                      );
                    },
                    child: const Text(
                      "View Saved Contact",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                    ),
                  ),
                ),
              ]),
            ],
          )
        ],
      )),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<int> addUsers() async {
    Contact firstUser = Contact(
        name: contactRequestModel!.name,
        age: 25,
        country: contactRequestModel!.country);
    List<Contact> listOfUsers = [firstUser];
    return await handler.insertUser(listOfUsers);
  }
}
