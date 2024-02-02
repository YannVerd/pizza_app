import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
// import 'package:pizza_app/providers/database_provider.dart';
// import 'package:provider/provider.dart';



class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
 ForgotPageState createState() => ForgotPageState();
}

class ForgotPageState extends State<ForgotPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pizz'App"),
        centerTitle: true,
      ), 
      body: ForgotPasswordScreen(
        headerBuilder: (context, constraints, shrinkOffset) {
          return Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 40),
            child: Icon(
              Icons.lock,
              color: Colors.blue,
              size: constraints.maxWidth / 4 * (1 - shrinkOffset),
            ),
          );
        },
      ),
    );
  }
}