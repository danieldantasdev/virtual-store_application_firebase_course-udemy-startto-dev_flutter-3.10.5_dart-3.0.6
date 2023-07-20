import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productData});

  final ProductData productData;

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState(productData);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  _ProductDetailScreenState(this.productData) {}

  final ProductData productData;
  String? _sizeSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title.toString()),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: AnotherCarousel(
              images:
                  productData.images!.map((url) => NetworkImage(url)).toList(),
              autoplay: true,
              dotSize: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  productData.title.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${productData.price!.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Tamanho",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    children: productData.sizes!
                        .map((e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _sizeSelected = e;
                                });
                              },
                              child: Container(
                                width: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0),
                                  ),
                                  border: Border.all(
                                    color: e == _sizeSelected
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey.shade500,
                                    width: 2.0,
                                  ),
                                ),
                                child: Text(
                                  e.toString(),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: _sizeSelected != null ? () {} : null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        LinearBorder.bottom(),
                      ),
                    ),
                    child: const Text("Adicionar ao carrinho"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Descrição",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  productData.description.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
