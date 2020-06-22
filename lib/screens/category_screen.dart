import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:loja_virtual/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["titulo"]),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on),),
              Tab(icon: Icon(Icons.list),)
            ],
          ),
        ),
        body: dadosFuturos(snapshot)
      ),
    );
  }
}

  FutureBuilder dadosFuturos(DocumentSnapshot snap){
    return FutureBuilder<QuerySnapshot>(
        future: snap.reference
        .collection("itens")
        .getDocuments()
        ,
        builder: (context, snap){
          if(!snap.hasData)
            return Center(child: CircularProgressIndicator(),);
          else
            return TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                      padding: EdgeInsets.all(4.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        childAspectRatio: 0.65, //divide a altura com a largura
                      ),
                      itemCount: snap.data.documents.length,
                      itemBuilder: (context, index){
                        ProductData data =
                        ProductData.fromDocument(
                            snap.data.documents[index]);
                        data.categoria = snap.data.toString();
                        return ProductTile("grade", data);
                      }
                  ),
                  ListView.builder(
                      padding: EdgeInsets.all(4.0),
                      itemCount: snap.data.documents.length,
                      itemBuilder: (context, index){
                        ProductData data = ProductData.fromDocument(
                            snap.data.documents[index]);
                        data.categoria = snap.data.toString();
                        return ProductTile("lista", data);
                      }
                  )
                ]
            );
        }
    );
  }
