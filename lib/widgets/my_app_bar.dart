import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


// ignore: must_be_immutable
class MyAppBar extends StatefulWidget{
  
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
  
}

class _MyAppBarState extends State<MyAppBar> {
  bool isLog = false;

  dynamic testLog(){
    if(FirebaseAuth.instance.currentUser != null) {   
      isLog= true;
    } else {
      isLog = false;
    }
    // print("user : ${FirebaseAuth.instance.currentUser}");
  }

  @override
  initState(){
    testLog();
    super.initState();
     
  }

  @override
  Widget build(BuildContext context ){

    return AppBar(
              title: const Text("Pizz'App"),
              centerTitle: true,
              leading: GestureDetector(
                child: Image.asset('../../lib/assets/images/pizza-wifi.png'), 
                onTap: (){
                  Navigator.pushNamed(context, '/home');
                },),
              elevation: 5,
              actions: <Widget> [
                isLog  ? IconButton(
                  icon: const Icon(Icons.manage_accounts),
                  onPressed: (){
                    Navigator.pushNamed(context, "/user");
                  },
                  tooltip:'User',            
                ) :
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  onPressed: (){
                    Navigator.pushNamed(context, "/login");
                  },
                  tooltip:'User',            
                ),
                isLog ?
                IconButton(
                  icon: const Icon(Icons.login_outlined),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context,'/');
                    
                    
                  } ,
                  tooltip:'User',            
                ): const SizedBox(),
              ],
              
        );
  
  }
}

