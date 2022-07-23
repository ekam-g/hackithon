import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/HomePage.dart';
import 'package:frontend/screens/ai_dis/dis_homepage.dart';
import 'package:frontend/screens/defender/defendUI.dart';
import 'package:frontend/screens/textthingy.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  _navbar createState() => _navbar();
}

class _navbar extends State<navbar> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] only for android black navigation bar. 3 button navigation control (legacy)

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            const MyHomePage(title: 'Home'),
            DisHomepage(),
            defender(),
            const ML(),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home_rounded,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
                filledIcon: Icons.favorite_rounded,
                outlinedIcon: Icons.favorite_border_rounded,
            ),
            BarItem(
              filledIcon: Icons.safety_check_rounded,
              outlinedIcon: Icons.safety_check_outlined,
            ),
            BarItem(
              filledIcon: Icons.text_increase_sharp,
              outlinedIcon: Icons.text_fields_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
