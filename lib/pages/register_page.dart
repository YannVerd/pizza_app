import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
// import 'package:pizza_app/providers/database_provider.dart';
// import 'package:provider/provider.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pizz'App"),
        centerTitle: true,
      ), 
      body: const  RegisterScreen(
          providerConfigs: [
            EmailProviderConfiguration(),
          ],
         
      ),
    );
  }
}