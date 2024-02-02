import 'package:flutter/material.dart';
import 'package:pizza_app/widgets/infos_orders.dart';
import 'package:pizza_app/widgets/map_sample.dart';
import 'package:pizza_app/widgets/my_app_bar.dart';
import 'package:pizza_app/widgets/user_profil.dart';
// import 'package:pizza_app/providers/database_provider.dart';
// import 'package:provider/provider.dart';




class UserPage extends StatefulWidget  {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _HomePageState();
}

class _HomePageState extends State<UserPage> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const  List<Widget> _widgetOptions = <Widget>[
    UserProfil(),
    InfosOrders(),
    MapSample(),
   
    
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
            label: 'Infos',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Historique',
       
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            label: 'Suivi',
          
          ),
          
         
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}