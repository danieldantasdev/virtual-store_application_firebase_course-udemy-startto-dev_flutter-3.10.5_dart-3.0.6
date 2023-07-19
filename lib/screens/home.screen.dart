import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
