class Pizza{
  int identifiant ;
  String imageUrl;
  String title ;
  List<int> types;
  List<int> tailles;
  double prix;
  List<String> ingdredients;
  int note;

  Pizza(this.identifiant, this.imageUrl, this.title, this.types, this.tailles, this.prix, this.ingdredients, this.note);

  Map<String,dynamic> createMap(){
    return {
      'productId': identifiant,
      'imageUrl': imageUrl,
      'title': title,
      'types': types,
      'tailles': tailles,
      'prix':  prix,
      'ingdredients': ingdredients,
      "note": note,

    };
  }

  Pizza.fromFirestore(Map<String,dynamic> firestoreMap): 
    identifiant = firestoreMap['identifiant'],
    imageUrl = firestoreMap['imageUrl'],
    title = firestoreMap['title'],
    types = firestoreMap['types'],
    tailles = firestoreMap['tailles'],
    prix = firestoreMap[' prix'],
    ingdredients = firestoreMap['ingdredient'],
    note = firestoreMap['note'];

} 