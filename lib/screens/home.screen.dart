import 'package:flutter/material.dart';

import '../tabs/tabs.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        HomeTab(),
      ],
    );
  }
}
