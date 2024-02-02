import 'package:flutter/material.dart';
import 'package:pizza_app/providers/base_composition_provider.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class MyDropdownMenu extends StatefulWidget {
  List options;
   MyDropdownMenu(this.options, {super.key});

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  late List list;
  late String dropDownValue;


  @override
  void initState() {
    list = widget.options;
    dropDownValue = list.first;
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropDownValue = value!;
          value == "blanche" ? Provider.of<BaseCompositionProvider>(context, listen: false).changeBase(1) : Provider.of<BaseCompositionProvider>(context, listen: false).changeBase(0);
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}