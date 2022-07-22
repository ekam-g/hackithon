import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:frontend/screens/HomePage.dart';
import 'package:frontend/screens/login/Settings.dart';
import 'package:frontend/screens/textthingy.dart';
import 'package:frontend/widgets/coolText.dart';

class navbar extends StatefulWidget {
  @override
  _navbar createState() => _navbar();
}

class _navbar extends State<navbar> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children:  const [
          MyHomePage(title: 'Home'),
          Text("implment"),
          ML(),
          Settings(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(Icons.home),
            title: coolText(
              text: 'Home',
              fontSize: 12,
            ),
            activeColor: Colors.blue,
            activeTitleColor: Colors.blue.shade600,
          ),
          BottomBarItem(
            icon: const Icon(Icons.school),
            title: coolText(
              text: 'Implement',
              fontSize: 10,
            ),
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: const Icon(Icons.text_fields_sharp),
            title: coolText(
              text: 'Text Scanner',
              fontSize: 9,
            ),
            backgroundColorOpacity: 0.1,
            activeColor: Colors.greenAccent.shade700,
          ),
          BottomBarItem(
            icon: const Icon(Icons.settings),
            title: coolText(
              text: 'Settings',
              fontSize: 12,
            ),
            activeColor: Colors.orange,
            activeIconColor: Colors.orange.shade600,
            activeTitleColor: Colors.orange.shade700,
          ),
        ],
      ),
    );
  }
}