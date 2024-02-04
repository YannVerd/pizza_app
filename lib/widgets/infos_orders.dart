import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/firestore/firestore.dart';


class InfosOrders extends StatefulWidget {
  const InfosOrders({super.key});

  @override
  State<InfosOrders> createState() => _InfosOrdersState();
}

class _InfosOrdersState extends State<InfosOrders> {

  // ignore: prefer_typing_uninitialized_variables
  late final  Future<List<dynamic>>? list;
  // List test = [{"id":"kduhfdzof", "pizzas": 3, "prix": 50.00}, {"id":"kduhfdzof", "pizzas": 3, "prix": 50.00}, {"id":"kduhfdzof", "pizzas": 3, "prix": 50.00}]; // work with this list without Future(and adapt the dataTable)
 
  var db = FireStoreService();

  @override
  void initState(){
    list = db.getOrdersByEmail(FirebaseAuth.instance.currentUser?.email) as Future<List<dynamic>>?;
    // print(list);

  super.initState();  

  }

  
    // testing Table
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: list, // your future data
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Numéro Commande',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Prix',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Pizzas',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: snapshot.data!.map((order) =>  DataRow(
                  
                          cells:  [
                            DataCell(Text(order)),
                            DataCell(Text(order["pizzas"].length.toString())),
                            DataCell(Text(order["prix"].toString())),
                            
                          ],
                          
                        ))
                    .toList(),
              ),
            );
            
        
          } else if (snapshot.hasError) {
            return const Text('Loading Error'); // error state
          } else {

          return const CircularProgressIndicator(); // loading state
        }

        },
    );
  }
}

