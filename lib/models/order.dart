

class Order{
   Object infoCustomers;

    List<dynamic> pizzas;
    double prix;


  Order(this.infoCustomers, this.pizzas, this.prix);

  Map<String,dynamic> createMap(){
    return {
      'infosCustomer': infoCustomers,
      'pizzas': pizzas,
      'prix': prix,
    };
  }
} 