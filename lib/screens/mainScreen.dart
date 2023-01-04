// ignore: file_names
// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:summarizer/screens/staticbar.dart';
import 'package:summarizer/screens/summarizer.dart';
import 'package:summarizer/screens/welcomescreen.dart';

// ignore: camel_case_types
class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const staticbar();
          } else {
            return const welcomescreen();
          }
        }),
      ),
    );
  }
}
