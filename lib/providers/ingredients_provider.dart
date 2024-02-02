import 'package:flutter/material.dart';

class IngredientsProvider extends ChangeNotifier{

  // ignore: prefer_final_fields
  List _ingredients= [["champignons", 1.1, false],["jambon", 2.0, false],["oeuf", 1.5, false], ["parmesan", 1.0, false]];


//getters:
  List? get ingredients => _ingredients;


//Setters:
 
}
