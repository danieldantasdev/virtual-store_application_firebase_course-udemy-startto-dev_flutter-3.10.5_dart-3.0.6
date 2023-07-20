import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('product').get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data!.docs
                      .map((e) => CategoryTileWidget(documentSnapshot: e)),
                  color: Colors.grey.shade700)
              .toList();
          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}
