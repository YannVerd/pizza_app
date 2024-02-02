import 'package:flutter/material.dart';
import 'package:pizza_app/widgets/menu_selection.dart';
import 'package:pizza_app/widgets/my_app_bar.dart';
// import 'package:pizza_app/providers/database_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:pizza_app/widgets/home.dart';
import 'package:pizza_app/widgets/shopping_cart.dart';


class HomePage extends StatefulWidget  {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    MenuSelection(),
    ShoppinCart(),
    
  ];

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
     appBar: const PreferredSize(preferredSize: Size.fromHeight(60),
child:  MyAppBar()),
     body:  _widgetOptions.elementAt(_selectedIndex),
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Menu',
       
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_sharp),
            label: 'Shopping Card',
          
          ),
         
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}



