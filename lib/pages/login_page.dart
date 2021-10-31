import 'package:flutter/material.dart';
import 'package:milkmanagement/ProgressHUD.dart';
import 'package:milkmanagement/api/api_service.dart';
import 'package:milkmanagement/model/login_model.dart';
import 'package:milkmanagement/pages/home_page.dart';
import 'package:milkmanagement/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:milkmanagement/utils/comman_dailog.dart';
import 'package:milkmanagement/utils/internet_connectivity.dart';
import 'package:open_settings/open_settings.dart';

import '../shared_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;
  LoginRequestModel? loginRequestModel;
  bool isApiCallProcess = false;
  bool checkInternetConnectivity = false;
  

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel();
    loginRequestModel!.loginName = 'admin';
    loginRequestModel!.loginPassword = 'admin';
    _checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.2,
    );
  }

  _checkConnection() async {
    checkInternetConnectivity = await InternetService.checkConnection();
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
                          "LogIn",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          initialValue: loginRequestModel!.loginName,
                          onSaved: (input) =>
                              loginRequestModel?.loginName = input,
                          validator: (input) => !input!.contains('m')
                              ? "Email Id Should be Valid"
                              : null,
                          decoration: InputDecoration(
                              hintText: "Email Address",
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.pinkAccent,
                              )),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: loginRequestModel!.loginPassword,
                          onSaved: (input) =>
                              loginRequestModel?.loginPassword = input,
                          validator: (input) => input!.length < 5
                              ? "Password should be more than 5 characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                              hintText: "Password",
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.pinkAccent,
                              )),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(1),
                                  icon: Icon(hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            if (checkInternetConnectivity == false) {
                              CommanDialog.hideLoading();
                              Get.defaultDialog(
                                title: "Alert",
                                content: Column(
                                  children: [
                                    const Text(
                                      "Internet Connection Required.Do You want to open internet Setting?",
                                    ),
                                    const SizedBox(height: 30),
                                    ElevatedButton(
                                      onPressed: () {
                                        OpenSettings.openDataRoamingSetting();
                                      },
                                      child:
                                          const Text('Open Internet Setting'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              if (validateAndSave()) {
                                debugPrint("$checkInternetConnectivity");
                                CommanDialog.showLoading();

                                APIService apiService = APIService();
                                apiService .login(loginRequestModel!)
                                    .then((value) => {
                                          setState(
                                            () {
                                              CommanDialog.hideLoading();
                                            },
                                          ),
                                          if (value.token!.isNotEmpty)
                                            {
                                              //print(value.token),
                                              SharedService.setLoginDetails(value.token),
                                              Get.off(() =>
                                                  const HomePAGE()), //Route New Page
                                              Get.snackbar("Success",
                                                  "LogIn Successfully..",
                                                  snackPosition:
                                                      SnackPosition.BOTTOM),
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
                                              Get.snackbar(
                                                  "Error", "Kindly Check Now"),
                                            }
                                        });
                              }
                            }
                          },
                          child: const Text(
                            "LogIn",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurpleAccent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _register(), // go to Sign up
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

  Widget _register() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Register()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 250),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
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

  // void showInSnackBar(String value) {
  //   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //  _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(value)));
  // }
}
