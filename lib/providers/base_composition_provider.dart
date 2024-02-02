import 'package:flutter/material.dart';

// ignore: camel_case_types
class BaseCompositionProvider extends ChangeNotifier{

  int _base = 0;


//getters:
  int get base => _base;


//Setters:
 void changeBase(nbr){
   _base = nbr;
   notifyListeners();
  }
}
