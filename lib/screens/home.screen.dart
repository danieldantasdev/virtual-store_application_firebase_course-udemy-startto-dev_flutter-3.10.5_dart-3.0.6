import 'package:flutter/material.dart';

import '../tabs/tabs.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: const HomeTab(),
          drawer: CustomDrawerWidget(pageController: _pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text(
              "Categorias",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: const CategoryTab(),
          drawer: CustomDrawerWidget(pageController: _pageController),
        ),
      ],
    );
  }
}
