import 'package:flutter/material.dart';
import 'package:pizza_app/providers/base_composition_provider.dart';
import 'package:pizza_app/providers/database_provider.dart';
import 'package:pizza_app/widgets/my_drop_down_button.dart';
import 'package:pizza_app/widgets/pizza_card.dart';
// import 'package:pizza_app/providers/database_provider.dart';
// import 'package:pizza_app/providers/shopping_cart_provider.dart';
// import 'package:pizza_app/widgets/pizza_card.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class MenuSelection extends StatefulWidget  {
  const MenuSelection({super.key});

  @override
  State<MenuSelection> createState() => _MenuSelectionState();
}

class _MenuSelectionState extends State<MenuSelection> {
  late List<dynamic>? entries;
  late List<dynamic> listFilteredPizzas;
  
 
  @override
  void initState() {
    super.initState();
    entries =  Provider.of<DataBaseProvider>(context, listen: false).pizzas ;
    // print( Provider.of<DataBaseProvider>(context, listen: false).pizzas);
    
   
  }
 
  @override
  Widget build(BuildContext context){
    
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyDropdownMenu(const ['rouge', 'blanche']),
              ],
            ),
            const SizedBox(height: 10),
            FutureBuilder<DatabaseEvent>(
            future:  FirebaseDatabase.instance.ref('/pizzas').once(), 
            builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
              List<Widget> children;
              if(snapshot.hasData) {
                List<dynamic> datas = snapshot.data!.snapshot.value as List;  // necessary chained method for retrieve de value
                return
                  Expanded(
                    child: ListView.builder(
                    
                      scrollDirection: Axis.vertical,
                      itemCount: datas.length,
                      itemBuilder: (context, index){
                        if(datas[index]['types'].contains(Provider.of<BaseCompositionProvider>(context,listen: false).base)){
                          return PizzaCard(datas[index], true);
                        } else {
                          return null;
                        }              
                      },
                    ),
                  );
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
                    )
          ]
        ),
      ),
    );
  }
}
 