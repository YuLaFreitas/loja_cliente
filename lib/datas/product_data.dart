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

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    titulo = snapshot.data["TITULO"];
    descricao = snapshot.data["descricao"];
    valor = snapshot.data["valor"];
    valor.floorToDouble();// testar = ##,##
    img = snapshot.data["img"];
    tam = snapshot.data["tam"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "titulo": titulo,
      "descricao": descricao,
      "valor": valor
    };
  }

}