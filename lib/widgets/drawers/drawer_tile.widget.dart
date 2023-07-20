import 'package:flutter/material.dart';

class DrawerTileWidget extends StatelessWidget {
  const DrawerTileWidget(
      {super.key,
      required this.iconData,
      required this.text,
      required this.pageController,
      required this.page});

  final IconData iconData;
  final String text;
  final PageController pageController;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          height: 60.0,
          child: Row(children: [
            Icon(
              iconData,
              size: 32,
              color: pageController.page == page
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade700,
            ),
            const SizedBox(
              width: 32,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: pageController.page == page
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade700,
              ),
            ),
          ]),
        ),
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
      ),
    );
  }
}
