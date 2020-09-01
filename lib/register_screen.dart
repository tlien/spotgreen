import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextStyle _textStyleInput =
      TextStyle(fontFamily: 'Futura', color: Colors.black, fontSize: 14.0);
  TextStyle _textStyleButton =
      TextStyle(fontFamily: 'Futura', color: Colors.white);

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _usernameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  bool _usernameFocused = false;
  bool _passwordFocused = false;

  String _usernameHint = "Username";
  String _passwordHint = "Password";
  BoxDecoration _inputDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(),
      color: Colors.grey[100]);


  @override
  void initState() {
    super.initState();

    _usernameFocus.addListener(() {
      if (_usernameFocus.hasFocus != _usernameFocused) {
        setState(() {
          _usernameFocused = _usernameFocus.hasFocus;
        });
      }
      _usernameHint = _usernameFocused ? "" : "Username";
    });

    _passwordFocus.addListener(() {
      if (_passwordFocus.hasFocus != _passwordFocused) {
        setState(() {
          _passwordFocused = _passwordFocus.hasFocus;
        });
      }
      _passwordHint = _passwordFocused ? "" : "Password";
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: SingleChildScrollView(child: registerForm(), padding: EdgeInsets.only(top: 300))),
    );
  }

  Widget usernameTextField() {
    return new TextFormField(
      focusNode: _usernameFocus,
      onTap: () {
        _usernameFocus.requestFocus();
      },
      controller: _usernameController,
      style: _textStyleInput,
      decoration: new InputDecoration.collapsed(
          hintText: _usernameHint,
          floatingLabelBehavior: FloatingLabelBehavior.never),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a username.";
        }
        return null;
      },
    );
  }

  Widget passwordTextField() {
    return new TextFormField(
      focusNode: _passwordFocus,
      onTap: () {
        _passwordFocus.requestFocus();
      },
      controller: _passwordController,
      obscureText: true,
      style: _textStyleInput,
      decoration: new InputDecoration.collapsed(
          hintText: _passwordHint,
          floatingLabelBehavior: FloatingLabelBehavior.never),
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter a password.";
        }
        return null;
      },
    );
  }

  Widget registerForm() {
    return Form(
        key: _formKey,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 60.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                height: 40.0,
                padding: const EdgeInsets.only(left: 8.0, right: 4.0, top: 12),
                decoration: _inputDecoration,
                child: usernameTextField(),
              ),
              Container(margin: EdgeInsets.symmetric(vertical: 5.0)),
              Container(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 4.0, top: 12),
                  height: 40.0,
                  decoration: _inputDecoration,
                  child: passwordTextField()),
              Container(margin: const EdgeInsets.symmetric(vertical: 5.0)),
              Container(
                  child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                          color: const Color(0xFF66CDAA),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0)),
                          child: Text("Register", style: _textStyleButton),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              SnackBar snackBar = SnackBar(
                                  content:
                                      Text("Hello " + _usernameController.text),
                                  duration: Duration(seconds: 2));
                              _scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                          })))
            ])));
  }
}
