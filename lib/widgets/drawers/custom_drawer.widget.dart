import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/models.dart';
import '../../screens/screens.dart';
import '../widgets.dart';

class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerWidget({super.key, required this.pageController});

  PageController pageController = PageController();

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

  @override
  Widget build(BuildContext context) {
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
                  child: Stack(
                    children: [
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
                      ScopedModelDescendant<UserModel>(
                        builder: (context, child, model) {
                          return Positioned(
                            left: 0.0,
                            bottom: 0.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isLoggedIn()
                                        ? "Entre ou Cadastre-se >"
                                        : "Sair",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  onTap: () {
                                    if (!model.isLoggedIn()) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SignInScreen(),
                                        ),
                                      );
                                    } else {
                                      model.signOut();
                                    }
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const Divider(),
                DrawerTileWidget(
                  iconData: Icons.home,
                  text: 'Início',
                  pageController: pageController,
                  page: 0,
                ),
                DrawerTileWidget(
                  iconData: Icons.list,
                  text: 'Produtos',
                  pageController: pageController,
                  page: 1,
                ),
                DrawerTileWidget(
                  iconData: Icons.location_on,
                  text: 'Lojas',
                  pageController: pageController,
                  page: 2,
                ),
                DrawerTileWidget(
                  iconData: Icons.playlist_add_check,
                  text: 'Meus pedidos',
                  pageController: pageController,
                  page: 3,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 32.0, top: 700.0),
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //           builder: (context) => SignInScreen(),
          //         ),
          //       );
          //     },
          //     child: const Row(
          //       children: [
          //         Text("Sair"),
          //         Icon(Icons.logout),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
