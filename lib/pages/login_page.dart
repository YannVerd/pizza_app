import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:pizza_app/providers/database_provider.dart';
// import 'package:provider/provider.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageDemoState createState() => LoginPageDemoState();
}

class LoginPageDemoState extends State<LoginPage> {


  final emailController =  TextEditingController();
  final pwdController =  TextEditingController();

@override
void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pizz'App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Title(color: Colors.white, child: const Text("Login Page")),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child:  Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset('../../lib/assets/images/pizza-wifi.png'),
                  ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: pwdController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, '/forgot');
              },
              child:const  Text(
                'Forgot Password',
                style: TextStyle(fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, '/register');
              },
              child:const  Text(
                'Register now',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(20)),
                child: TextButton(
              onPressed: () async {
                  try {
                   await FirebaseAuth.instance.signInWithEmailAndPassword( // initiate this in a variable for use it later
                      email: emailController.text,
                      password: pwdController.text,
                    );
                    // print(credential);
                    // ignore: use_build_context_synchronously
                    // await Provider.of<DataBaseProvider>(context, listen: false).getAll();
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context,'/home');
                    
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      AlertDialog(
                        title: const Text('User not found'),
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('No user founded with this information'),
                              Text('Please retry'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Approve'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    } else if (e.code == 'wrong-password') {
                      AlertDialog(
                        title: const Text('Wrong Password'),
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('this is not the good password for the user'),
                              Text('Please retry'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Approve'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25), 
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}