import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuths {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  UserCredential? userCredential;

  sign(email, password, context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => emailVarification(context));
    } catch (e) {
      _showDiolog("$e", context);
    }
  }

  login(email, password, context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => _showDiolog("Login Successfully", context));
    } catch (e) {
      _showDiolog("$e", context);
    }
  }

  emailVarification(context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification().then((value) => _showDiolog(
            "Varification email Send to your registered email address ${user.email} ",
            context));
        if (user.emailVerified == true) {
          _showDiolog("verification completed", context);
          print(
              "verification completed ///////////////////////////////////////////////");
        }
      }
    } catch (e) {
      print('Error sending verification email: $e');
    }
  }
}

_showDiolog(String title, context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      content: Text("$title"),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"))
      ],
    ),
  );
}
