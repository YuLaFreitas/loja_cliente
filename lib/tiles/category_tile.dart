import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;
  DocumentSnapshot documentSnapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        leading: CircleAvatar(radius: 25.0,backgroundColor: Colors.transparent,backgroundImage: NetworkImage(snapshot.data["icone"]),),
        title: Text(snapshot.data["titulo"]),
        trailing: Icon(Icons.keyboard_arrow_down),
        children: <Widget>[
            SubCategoria(context, snapshot)
        ]);
  }

  Widget SubCategoria(BuildContext context, DocumentSnapshot snap) {
    return
      FutureBuilder<QuerySnapshot>(
          future: snap.reference.collection("catalogo").getDocuments(),
          builder: (context, snap){
            if(!snap.hasData) return Container(color: Colors.red,);
            return Column(
              children: snap.data.documents.map((ref){
                return ListTile(
                  title: Text(ref.data["titulo"]),
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CategoryScreen(ref))
                    );
                  },
                );
              }).toList(),
            );
          },
      );
  }
}
