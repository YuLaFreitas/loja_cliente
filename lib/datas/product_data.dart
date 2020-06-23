import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductData {

  String categoria;
  String id;

  String titulo;
  String descricao;

  double valor;

  List img;
  List tam;
  List cor;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    titulo = snapshot.data["titulo"];
    descricao = snapshot.data["descricao"];
    valor = snapshot.data["valor"] + 00.00;
    valor.floorToDouble();
    img = snapshot.data["img"];
    tam = snapshot.data["tam"];
    cor = snapshot.data["cor"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "titulo": titulo,
      "descricao": descricao,
      "valor": valor
    };
  }

}