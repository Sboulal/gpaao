// ignore_for_file: file_names

import 'package:amfrom_app/pages/comite.dart';
import 'package:amfrom_app/pages/editorial.dart';
import 'package:amfrom_app/pages/groupe.dart';
import 'package:amfrom_app/pages/guide.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  final int initialPage;

  const MainNavigation({super.key, this.initialPage = 0});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _page;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _pages = const [Editorial(), Comite(), Groupe(), Guide()];

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        body: _pages[_page],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          items: <Widget>[
            Image(
              image: AssetImage('assets/icons/2.png'),
              width: 30,
              height: 30,
            ),
            Image(
              image: AssetImage('assets/icons/3.png'),
              width: 30,
              height: 30,
            ),
            Image(
              image: AssetImage('assets/icons/4.png'),
              width: 30,
              height: 30,
            ),
            Image(
              image: AssetImage('assets/icons/5.png'),
              width: 30,
              height: 30,
            ),
          ],
          color: const Color(0xFF0e1763),
          buttonBackgroundColor: const Color(0xFF0e1763),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
