import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchats/components/custom_button.dart';
import 'package:flashchats/contants.dart';
import 'package:flashchats/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  bool isLoading = false;

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential loggenIn = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (loggenIn != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('error occured $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputStyle.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  setState(() {
                    password = value;
                  });
                },
                decoration:
                    InputStyle.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              MyCustomButton(
                  customColor: Colors.lightBlueAccent,
                  label: 'Log In',
                  onPressed: () {
                    loginUser();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
