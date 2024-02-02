import 'package:flutter/material.dart';
import 'package:pizza_app/firestore/firestore.dart';



class DataBaseProvider extends ChangeNotifier{

  List<dynamic>? _pizzas;


//getters:
  List<dynamic>? get pizzas => _pizzas;


//Setters:
  Future<void> getAll() async {
    var db = FireStoreService();
    var data = await db.getAllDatas() as List<dynamic>;
    // print("data: $data");
    _pizzas = data;
    // print('fetch: $_pizzas');
    notifyListeners();
  }

}