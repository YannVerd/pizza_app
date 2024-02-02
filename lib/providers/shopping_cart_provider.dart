import 'package:flutter/material.dart';

class ShoppingCartProvider extends ChangeNotifier{

  // ignore: prefer_final_fields
  List _shoppingCart = [];


//getters:
  List? get shoppingCart => _shoppingCart;


//Setters:
 void addOrder(order){
  // print("order : $order");
   _shoppingCart.add(order);
   notifyListeners();
  //  print("in provider : $shoppingCart");
  }

  void deleteOrder(index){
    _shoppingCart.removeAt(index);
    notifyListeners();
  }
}
