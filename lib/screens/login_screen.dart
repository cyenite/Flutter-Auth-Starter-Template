import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypessage/resources/firebase_repository.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseRepository _repository = FirebaseRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginButton(),
    );
  }

  Widget loginButton() {
    return Center(
      child: FlatButton(
        padding: EdgeInsets.all(35),
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        onPressed: () => performLogin(),
      ),
    );
  }

  void performLogin() {
    _repository.signIn().then((user) {
      print(user);
      if (user != null) {
        authenticateUser(user);
      } else {
        print('There was an error');
      }
    });
  }

  void authenticateUser(FirebaseUser user) {
    _repository.authenticateUser(user).then((isNewUser) {
      if (isNewUser) {
        _repository.addDataToDb(user).then((value) {
          Get.to(HomeScreen());
        });
      } else {
        Get.to(HomeScreen());
      }
    });
  }
}
