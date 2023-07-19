import 'package:flutter/material.dart';

import '../widgets.dart';

class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerWidget({super.key, required this.pageController});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Widget buildDrawerBackground() => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 203, 236, 241),
                Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );
    return Drawer(
      child: Stack(
        children: [
          buildDrawerBackground(),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 16.0),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  height: 200,
                  child: Stack(children: [
                    const Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Flutter's\nClothing",
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Olá,",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Entre ou Casdastre-se >",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                const Divider(),
                DrawerTileWidget(
                    iconData: Icons.home,
                    text: 'Início',
                    pageController: pageController,
                    page: 0),
                DrawerTileWidget(
                    iconData: Icons.list,
                    text: 'Produtos',
                    pageController: pageController,
                    page: 1),
                DrawerTileWidget(
                    iconData: Icons.location_on,
                    text: 'Lojas',
                    pageController: pageController,
                    page: 2),
                DrawerTileWidget(
                    iconData: Icons.playlist_add_check,
                    text: 'Meus pedidos',
                    pageController: pageController,
                    page: 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
