

class Order{
   Object infosCustomer;

    List<dynamic> pizzas;
    double prix;


  Order(this.infosCustomer, this.pizzas, this.prix);

  Map<String,dynamic> createMap(){
    return {
      'infoCustomers': infosCustomer,
      'pizzas': pizzas,
      'prix': prix,
    };
  }
} 