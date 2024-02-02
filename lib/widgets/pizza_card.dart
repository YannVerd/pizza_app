import 'package:flutter/material.dart';
import 'package:pizza_app/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';




// ignore: must_be_immutable
class PizzaCard extends StatefulWidget{
  dynamic pizza;
  bool isPurchasable = false;

  PizzaCard(this.pizza, this.isPurchasable, {super.key});

  @override
  State<PizzaCard> createState() => _PizzaCardState();
}

class _PizzaCardState extends State<PizzaCard> {
  final dGreen = Colors.greenAccent;

  
  
 @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap : (){ // Display list of details if clicked
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(widget.pizza["titre"]),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Image.network(
                      widget.pizza["imageUrl"],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text("Types : ${widget.pizza['types']}"),
                    const SizedBox(height: 10),
                    const Text('Liste des Ingredients :'),
                    const SizedBox(height: 10),
                    ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: widget.pizza['ingredients'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(widget.pizza['ingredients'][index]),
                          ]
                          );
                     }
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fermer'),
                ),
              ],
            );
          }
        );
      },
      child: Container(
        constraints: const BoxConstraints(maxWidth: 350),
        height: 210,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        boxShadow: [BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 4,
          offset: const Offset(0,4),
        )],
        ),
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                 ),
                image: DecorationImage(
                  image: NetworkImage(widget.pizza['imageUrl']),
                  fit: BoxFit.cover,
                  ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    right: - 15,
                    child: MaterialButton(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      onPressed: () {}, 
                      child: Icon(Icons.favorite, color: dGreen,)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.pizza['titre'],
                    softWrap: true,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "\$ ${widget.pizza['prix']}",
                    
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                ],
              ),        
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    for (int i = 0; i < widget.pizza['note'] ; i++)
                      Icon(Icons.star_rate, 
                                  color: dGreen,
                                  size: 14.0,
                                ),
                    widget.isPurchasable ? ElevatedButton(
                      onPressed: (){
                        Provider.of<ShoppingCartProvider>(context, listen: false).addOrder(widget.pizza);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${widget.pizza['titre']} a bien été ajouté a votre panier")));
                      }, 
                      child: const Row(children: [Icon(Icons.add_shopping_cart), Text('Add to Cart')],)
                      
                    ) : const Text(''), // the condition did not work with false or other
                  ]
                ),
            ),
          ],
        ),
      ),
    );

  }
}

