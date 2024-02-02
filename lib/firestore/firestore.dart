

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

  Future<void> getOrdersByEmail(email) async {
    var data= await _ref.child("/orders").orderByChild('email').equalTo(email).once();

    print("query: ${data.snapshot.value}");
  }
}