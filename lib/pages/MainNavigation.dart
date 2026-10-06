// ignore_for_file: file_names

import 'package:amfrom_app/pages/comite.dart';
import 'package:amfrom_app/pages/editorial.dart';
import 'package:amfrom_app/pages/groupe.dart';
import 'package:amfrom_app/pages/guide.dart';
import 'package:amfrom_app/pages/calculatrice_page.dart'; // <--- Import dyal l-page jdida
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
  
  // Zedt CalculatricePage() f l-kher dyal l-liste
  final List<Widget> _pages = const [
    Editorial(), 
    Comite(), 
    Groupe(), 
    Guide(),
    CalculatricePage() 
  ];

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
          items: const <Widget>[
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
            // Icône jdida dyal l-calculatrice
            Icon(
              Icons.calculate_outlined,
              size: 30,
              color: Colors.white,
            ),
          ],
          color: const Color(0xFF0e1763),
          buttonBackgroundColor: const Color(0xFF0e1763),
          backgroundColor: Colors.transparent, // mn l-a7san tkon transparent bach maybanch byed m3a l-curved
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
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