import 'package:flutter/material.dart';

// import 'package:pizza_app/providers/database_provider.dart';
import 'package:pizza_app/widgets/pizza_card.dart';
// import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:carousel_slider/carousel_slider.dart';



class Home extends StatefulWidget  {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  Widget build(BuildContext context){


    return SingleChildScrollView(
          child: FutureBuilder<DatabaseEvent>(
          future:  FirebaseDatabase.instance.ref('/pizzas').once(), 
          builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
            List<Widget> children;
            if(snapshot.hasData) {
              List<dynamic> datas = snapshot.data!.snapshot.value as List;  // necessary chained method for retrieve de value
              children = <Widget>[
               const Text('Welcome', style: TextStyle(fontSize: 25)),
               const SizedBox(height: 40),
                CarouselSlider(
                  options: CarouselOptions(height: 220.0),
                  items: datas.map((pizza) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          // decoration: BoxDecoration(
                          //   color: Theme.of(context).primaryColor
                          // ),
                          child: PizzaCard(pizza, false),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    const Text('Pizza du Jour', style: TextStyle(fontSize: 18),),
                    SizedBox(width: 300, child: PizzaCard(datas[0], false)),                   
                  ],
                ),
            
                
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
     );
  }
}
