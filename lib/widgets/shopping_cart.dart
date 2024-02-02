import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/providers/ingredients_provider.dart';
import 'package:pizza_app/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/firestore/firestore.dart';
import 'package:pizza_app/models/order.dart';



class ShoppinCart extends StatefulWidget{
  const ShoppinCart({super.key});


  @override
  State<ShoppinCart> createState() => _ShoppinCartState();
}

class _ShoppinCartState extends State<ShoppinCart> {
late List<dynamic>? cart = [];
late double total = 0;

@override
  void initState()  {
    cart =  Provider.of<ShoppingCartProvider>(context, listen: false).shoppingCart;
    // print(cart);
    for(int i=0; i < cart!.length; i++){
      total += cart![i]['prix'];
    }
    super.initState();
  }

@override
  Widget build(BuildContext context){
  return cart!.isEmpty? const Text('no orders') : Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: cart!.length,
        itemBuilder: (BuildContext context, int index) {
          return 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(cart![index]['titre']),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:const EdgeInsets.all(2),
                  ),
                  onPressed: (){
                  setState(() {
                    Provider.of<ShoppingCartProvider>(context, listen: false).deleteOrder(index);
                    cart!.removeAt(index);
                  });
                }, child: const Text('Supprimer', style: TextStyle(fontSize: 6),)),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:const EdgeInsets.all(2),
                  ),
                  onPressed: (){
                    showDialog(context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: const Text('Choose your additionnal ingredients'),
                        content: ListView.builder(
                          itemCount: Provider.of<IngredientsProvider>(context, listen: false).ingredients!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var ingredient = Provider.of<IngredientsProvider>(context, listen: false).ingredients![index];
                            // print(ingredient[2]); // init a variable to the value index of ingredient list provide
                            return CheckboxListTile(
                              title: Text('${ingredient[0]}'),
                              selected: ingredient[2],
                              value: ingredient[2],
                              onChanged: (bool? value) {
                                
                                setState((){
                                  ingredient[2] = value!;
                                  ingredient[2] ? total += ingredient[1] : total -= ingredient[1];
                                  // print(value);
                                  // print(total);
                                });
                              },
                            );
                          }
                          
                        ),
                      );
                    }
                    );
                }, child: const Text('Personnaliser', style: TextStyle(fontSize: 6),)),
                Text("${cart![index]['prix']} \$")
              ]
              );
        }
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text('Total : $total \$'),
        ElevatedButton(child:  const Text('Payer'), onPressed: (){
         String? email =  FirebaseAuth.instance.currentUser?.email ?? "";
         var db = FireStoreService();
         if(email == "") {
          Order newOrder = Order({'email': 'fake@email.fr', 'tel': '0876283232'}, Provider.of<ShoppingCartProvider>(context, listen: false).shoppingCart!, total);
          Map finalOrder = newOrder.createMap();
          db.addOrder(finalOrder);
         } else {
          Order newOrder = Order({'email': email, 'tel': '0876283232'}, Provider.of<ShoppingCartProvider>(context, listen: false).shoppingCart!, total);
          Map finalOrder = newOrder.createMap();
          db.addOrder(finalOrder);
         }
          
        }),
        ]
      ),
    ],
  );
}
}