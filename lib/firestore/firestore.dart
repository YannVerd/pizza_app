

import 'package:pizza_app/models/Pizza.dart';
import 'package:firebase_database/firebase_database.dart';



class FireStoreService {
  final _ref = FirebaseDatabase.instance.ref();
  

  Future<void> saveProduct(Pizza pizza) {
    return _ref.child('/pizzas').update(pizza.createMap());
        
  }

  Future<Object?> getAllDatas() async {
    final snapshot = await _ref.child('/pizzas').get();
    if (snapshot.exists) {
      return snapshot.value;
    } else {
      String obj= 'No datas';
      return obj;
    }
  }

  Future<void> addOrder(order) async {
    await _ref.child('/orders').push().set(order);
  }

  Future<List?> getOrdersByEmail(email) async {
    List idsOrders = []; // list of id's order
    List ordersCurrentUser = []; // list of current users order

    // var data= await _ref.child("/orders").orderByChild('email').equalTo(email).once(); // result = null

    DatabaseEvent data= await _ref.child("/orders").once();

    Map listOrders = data.snapshot.value as Map; 

  // I think all is simplifiable in this function
  // match the idOrder with the email passs to parameter;
  
    listOrders.forEach((id, order) {
      order.forEach((key, value){
        if(key == 'infosCustomer'){
          value.forEach((key,value){
            if(key == 'email'){
              value == email ? idsOrders.add(id) : false;
            }
          });
        }
      });
    });

  // browse both list for add matchiong order
    listOrders.forEach((id, order){
      for(int i = 0; i < idsOrders.length; i++){
        idsOrders[i] == id ? ordersCurrentUser.add(order) : false;
      }
    });
      
  
  return ordersCurrentUser;
      

  }
}