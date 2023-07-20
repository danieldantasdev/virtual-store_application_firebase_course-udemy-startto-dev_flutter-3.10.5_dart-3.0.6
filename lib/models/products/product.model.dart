import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String? category;
  String? id;
  String? title;
  String? description;
  double? price;
  List? images;
  List? sizes;

  ProductData.fromDocument(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    title = (documentSnapshot.data() as Map<String, dynamic>)["title"];
    description =
        (documentSnapshot.data() as Map<String, dynamic>)["description"];
    price = (documentSnapshot.data() as Map<String, dynamic>)["price"] + 0.0;
    images = (documentSnapshot.data() as Map<String, dynamic>)["images"];
    sizes = (documentSnapshot.data() as Map<String, dynamic>)["sizes"];
  }
}
