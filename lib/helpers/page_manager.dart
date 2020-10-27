import 'package:flutter/material.dart';

class PageScreen extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView();
  }
}
