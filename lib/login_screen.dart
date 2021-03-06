import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextStyle _textStyleInput =
      TextStyle(fontFamily: 'Futura', color: Colors.black, fontSize: 14.0);
  TextStyle _textStyleButton =
      TextStyle(fontFamily: 'Futura', color: Colors.white);

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // FocusNode _editingFocus = FocusNode();

  BoxDecoration _inputDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      // border: Border.all(),
      color: Colors.grey[100]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.green[100],
        body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[logo(), loginForm()],
              ),
            )));
  }

  Widget logo() {
    return Container(height: 300.0);
  }

  Widget loginForm() {
    return Form(
        key: _formKey,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40.0,
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 4.0, top: 12),
                  decoration: _inputDecoration,
                  child: TextFormField(
                    controller: _usernameController,
                    style: _textStyleInput,
                    decoration:
                        new InputDecoration.collapsed(hintText: "Username"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter a username.";
                      }
                    },
                  ),
                ),
                Container(margin: EdgeInsets.symmetric(vertical: 5.0)),
                Container(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 4.0, top: 12),
                  height: 40.0,
                  decoration: _inputDecoration,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: _textStyleInput,
                    decoration:
                        new InputDecoration.collapsed(hintText: "Password"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter a password.";
                      }
                    },
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () =>
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Forgot password."),
                            duration: Duration(seconds: 2),
                          )),
                      child: Text("Forgot your password?",
                          style: TextStyle(
                              fontFamily: "Futura",
                              color: Colors.black54,
                              fontSize: 12)),
                    )),
                Container(margin: const EdgeInsets.symmetric(vertical: 5.0)),
                Container(
                  child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                          color: const Color(0xFF66CDAA),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0)),
                          child: Text("Sign in", style: _textStyleButton),
                          onPressed: () {
                            SnackBar snackBar = SnackBar(
                                content:
                                    Text("Hello " + _usernameController.text),
                                duration: Duration(seconds: 2));
                            _scaffoldKey.currentState.showSnackBar(snackBar);
                          })),
                ),
                Container(
                  child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                          color: const Color(0xFF3b5998),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0)),
                          child: Text("Sign in using Facebook",
                              style: _textStyleButton),
                          onPressed: () {
                            SnackBar snackBar = SnackBar(
                                content: Text("Signing in via Facebook..."),
                                duration: Duration(seconds: 2));
                            _scaffoldKey.currentState.showSnackBar(snackBar);
                          })),
                ),
                Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () =>
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Create an account."),
                            duration: Duration(seconds: 2),
                          )),
                      child: Text("Don't have an account? Sign up!",
                          style: TextStyle(
                              fontFamily: "Futura",
                              fontSize: 12.0,
                              color: Colors.black54)),
                    )),
              ],
            )));
  }
}
