import 'package:amfrom_app/widget/app_header.dart';
import 'package:amfrom_app/widget/card.dart';
import 'package:amfrom_app/widget/white_content_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Groupe extends StatefulWidget {
  const Groupe({super.key});

  @override
  State<Groupe> createState() => _GroupeState();
}

class _GroupeState extends State<Groupe> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  final List<dynamic> items = [
    ['Abdi', 'Chaimaa'],
    ['Nadir ', 'Widad '],
    ['Hachlaf', 'Meriam'],
    ['Bekkouche', 'Soukaina'],
    ['Taleb', 'Khaola'],
    ['Lemsyeh  ', 'Hajar'],
    ['Fallone ', 'Amoussou'],
    ['Kdadri ', ' Sanaa'],
    ['lamsaiahe ', 'Oumaima'],
    ['Omari ', 'Loubna'],
    ['Rania ', 'Alem'],
    ['Yousra ', 'Harrak'],
    ['Belrhali ', 'Intissar'],
    ['Ibrahimi', 'Sara'],
    ['El Tagani Roda', 'Hassan'],
    ['Al Kharassani ', 'Walae'],
    ['Kriouile', 'Safaa'],
    ['Mohib', 'Layla'],
    ['Gendoula ', 'Rana'],
    ['Benslimane', ' Amine'],
    ['El yakoubi ', 'Soumaya'],
    ['Aboumediane  ', 'Chaimae'],
    ['Kouanga', 'Andy Jeffry'],
    ['Toumi ', 'Safae'],
    ['Atmane ', 'Boutaina'],
    ['Zejly ', 'Salwa'],
    ['Sabri ', 'Oussama'],
    ['Ismail ', 'Essadi'],
    ['Amarou ', 'Boutaina'],
    ['Lumbaba Kunga ', 'Gisele'],
    ['El Afeya ', 'Jihad'],
    ['Monique Tine  ', 'Marie'],
    ['Laamrani El Idrissi ', 'Malak'],
    ['Aachati ', 'Charaf Eddine'],
    ['Rachidi ', 'Fadwa'],
    ['Aaddane  ', 'Salma'],
    ['El Oualladi ', ' Oumayma'],
    ['Charif ', 'Hamza'],
    ['Alaoui ', 'Salma'],
    ['Chaabani  ', 'Khaoula'],
    ['Mellal', 'Aya'],
  ].toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0e1763),
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              title: "GROUPE DE TRAVAIL",
              assetGif: 'assets/icons/4.gif',
            ),
            WhiteContentContainer(
              topRadius: 60,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CustomcardGroup(
                    nom: items[index][0],
                    prenom: items[index][1],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
