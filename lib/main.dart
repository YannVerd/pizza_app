import 'package:flutter/material.dart';
import 'package:pizza_app/assets/themes/theme.dart';
import 'package:pizza_app/pages/forgot_pwd_page.dart';
import 'package:pizza_app/pages/home_page.dart';
import 'package:pizza_app/pages/register_page.dart';
import 'package:pizza_app/providers/ingredients_provider.dart';
import 'package:pizza_app/providers/shopping_cart_provider.dart';
import 'package:pizza_app/providers/base_composition_provider.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/providers/database_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:pizza_app/pages/login_page.dart';
import 'package:pizza_app/pages/user_page.dart';


void main() async  {

  Provider.debugCheckInvalidValueType = null; // fiw a bug whe ntry to send query to the database

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      Provider<DataBaseProvider>(create: (_)=> DataBaseProvider()),
      Provider<ShoppingCartProvider>(create: (_)=> ShoppingCartProvider()),
      Provider<BaseCompositionProvider>(create: (_)=> BaseCompositionProvider()),
      Provider<IngredientsProvider>(create: (_)=> IngredientsProvider())
    ], 
  child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: myTheme,
      routes: {
        '/login':(context) => const LoginPage(),
        '/home':(context) => const HomePage(),
        '/user':(context) => const UserPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot': (context) => const ForgotPage(),
      },
      home: const HomePage(),

    );
  }
}

