import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.documentSnapshot});

  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:
              Text((documentSnapshot.data() as Map<String, dynamic>)["title"]),
          centerTitle: true,
          bottom: const TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              icon: Icon(
                Icons.grid_on,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('product')
                  .doc(documentSnapshot.id)
                  .collection('items')
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return TabBarView(
                    children: [
                      GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          return CategotyDetailTileWidget(
                            type: "grid",
                            productData: ProductData.fromDocument(
                                snapshot.data!.docs[index]),
                          );
                        },
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          return CategotyDetailTileWidget(
                            type: "list",
                            productData: ProductData.fromDocument(
                                snapshot.data!.docs[index]),
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
