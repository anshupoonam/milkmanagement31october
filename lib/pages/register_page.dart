import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkmanagement/ProgressHUD.dart';
import 'package:milkmanagement/api/api_service.dart';
import 'package:milkmanagement/model/register_model.dart';
import 'package:milkmanagement/pages/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;
  RegisterRequestModel? registerRequestModel;
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
    registerRequestModel = RegisterRequestModel();
    registerRequestModel!.emailId = 'eve.holt@reqres.in';
    registerRequestModel!.password = 'pistol';
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.2,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Colors.pink[200],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin:
                      const EdgeInsets.symmetric(vertical: 85, horizontal: 20),
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
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Register",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          initialValue: registerRequestModel!.emailId,
                          onSaved: (input) =>
                              registerRequestModel?.emailId = input,
                          validator: (input) =>
                              input!.isEmpty ? "Please Enter Name" : null,
                          decoration: InputDecoration(
                            hintText: "Email",
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.pinkAccent,
                            )),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.pink[200],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          initialValue: registerRequestModel!.password,
                          onSaved: (input) =>
                              registerRequestModel?.password = input,
                          validator: (input) => input!.length < 5
                              ? "Password should be more than 5 characters"
                              : null,
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.pinkAccent,
                            )),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.pink[200],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            if (validateAndSave()) {
                              // print( 'Register body: ${registerRequestModel!.toJson()}');
                              setState(() {
                                isApiCallProcess = true;
                              });
                              APIService apiService = APIService();
                              apiService
                                  .register(registerRequestModel!)
                                  .then((value) => {
                                        setState(() {
                                          isApiCallProcess = false;
                                        }),
                                        if (value.token!.isNotEmpty)
                                          {
                                            print(
                                                'Register Response status2: ${value.token}'),
                                            //print("if"),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Register Successfully..'),
                                              ),
                                            ),
                                          }
                                        else if (value.token!.isEmpty)
                                          {
                                            // print("else"),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "User Password Wrong.."),
                                              ),
                                            )
                                          }
                                        else
                                          {
                                            //print("else2"),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text("error"),
                                              ),
                                            )
                                          }
                                      });
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurpleAccent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _logIn(), // go to Sign up
          ],
        ),
      ),
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

//https://github.com/afzalali15/Flutter-DarkTheme-Demo/blob/master/pubspec.yaml
  Widget _logIn() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 250),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Already Registerd ?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'LogIn',
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
