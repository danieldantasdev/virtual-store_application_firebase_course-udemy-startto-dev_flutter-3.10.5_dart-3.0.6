import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../screens/screens.dart';

class CategotyDetailTileWidget extends StatelessWidget {
  const CategotyDetailTileWidget(
      {super.key, required this.type, required this.productData});

  final String type;
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productData: productData,
            ),
          ),
        );
      },
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      productData.images![0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              productData.title.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "R\$ ${productData.price?.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Image.network(productData.images![0]),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          productData.title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "R\$ ${productData.price?.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
