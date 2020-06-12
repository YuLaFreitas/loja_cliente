import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  String category;
  String id;

  String title;
  String description;

  double price;

  List images;
  List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["titulo"];
    description = snapshot.data["descricao"];
    price = snapshot.data["valor"] + 0.0;
    images = snapshot.data["img"];
    sizes = snapshot.data["tamanho"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "titulo": title,
      "descricao": description,
      "preco": price
    };
  }

}