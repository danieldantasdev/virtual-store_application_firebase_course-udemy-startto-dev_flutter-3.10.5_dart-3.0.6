import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTileWidget extends StatelessWidget {
  const CategoryTileWidget({super.key, required this.documentSnapshot});

  final DocumentSnapshot documentSnapshot;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(
          (documentSnapshot.data() as Map<String, dynamic>)["icon"],
        ),
      ),
      title: Text((documentSnapshot.data() as Map<String, dynamic>)["title"]),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {},
    );
  }
}
