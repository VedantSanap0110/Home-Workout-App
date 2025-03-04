import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homeworkoutt/homepage.dart';
import 'package:homeworkoutt/login.dart';
import 'package:homeworkoutt/screen/gender_page.dart';
import 'homepage.dart';
import 'mainhomepage.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainHomePage();// Add your authenticated screen widget here;
          } else {
            return Login();// Add your unauthenticated screen widget here;
          }
        },
      ), // StreamBuilder
    ); // Scaffold
  }
}
