import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/datas/product_data.dart';

class CartProduct {

  String cid;

  String category;
  String pid;

  int quantity;
  String size;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data["categoria"];
    pid = document.data["pid"];
    quantity = document.data["quantidade"];
    size = document.data["tamanho"];
  }

  Map<String, dynamic> toMap(){
    return {
      "categoria": category,
      "pid": pid,
      "quantidade": quantity,
      "tamanho": size,
      "produto": productData.toResumedMap()
    };
  }

}