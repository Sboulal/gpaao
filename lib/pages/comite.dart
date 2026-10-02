import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/app_header.dart';
import '../widget/white_content_container.dart';
import '../widget/customcard.dart';

class Comite extends StatelessWidget {
  const Comite({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0e1763),
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: "COMITES", assetGif: 'assets/icons/3.gif'),
            WhiteContentContainer(
              topRadius: 60,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  _buildSectionTitle("COORDINATEURS DU GUIDE"),
                  Customcard(
                    prenom: 'Dr Hind',
                    nom: 'El yacoubi',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/41.png',
                  ),
                  Customcard(
                    prenom: 'Pr Sarah',
                    nom: 'Naciri',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/22.png',
                  ),
                  Customcard(
                    prenom: 'Pr Hind',
                    nom: 'Mrabti',
                    desc: 'Professeur de l’enseignement supérieur, INO, Rabat',
                    image: 'assets/groupe/2.jpg',
                  ),
                  _buildSectionTitle("RESPONSABLE DU GUIDE"),
                  Customcard(
                    prenom: 'Pr Hassan',
                    nom: 'Errihani',
                    desc: 'Chef de service, INO, Rabat',
                    image: 'assets/groupe/1.jpg',
                  ),
                  _buildSectionTitle("COMITE DE REDACTION"),
                  Customcard(
                    prenom: 'Pr Hassan',
                    nom: 'Errihani',
                    desc: 'Chef de service, INO, Rabat',
                    image: 'assets/groupe/1.jpg',
                  ),
                  Customcard(
                    prenom: 'Pr Hind',
                    nom: 'Mrabti',
                    desc: 'Professeur de l’enseignement supérieur, INO, Rabat',
                    image: 'assets/groupe/2.jpg',
                  ),
                  Customcard(
                    prenom: 'Pr Ibrahim',
                    nom: 'El Ghissassi',
                    desc: 'Professeur de l’enseignement supérieur, INO, Rabat',
                    image: 'assets/groupe/5.png',
                  ),
                  Customcard(
                    prenom: 'Pr Saber',
                    nom: 'Boutayeb',
                    desc: 'Professeur de l’enseignement supérieur, INO, Rabat',
                    image: 'assets/groupe/6.png',
                  ),
                  Customcard(
                    prenom: 'Pr Sarah',
                    nom: 'Naciri',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/22.png',
                  ),

                  Customcard(
                    prenom: 'Pr Hanane',
                    nom: 'Inrhaouen',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/29.png',
                  ),
                  Customcard(
                    prenom: 'Pr Siham',
                    nom: 'Lkhoyaali',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/46.png',
                  ),
                  Customcard(
                    prenom: 'Pr Salma',
                    nom: 'Najem',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/56.png',
                  ),
                  Customcard(
                    prenom: 'Dr Hind',
                    nom: 'El yacoubi',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/41.png',
                  ),

                  Customcard(
                    prenom: 'Dr Asmae',
                    nom: 'Lakhdissi',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/49.png',
                  ),
                  Customcard(
                    prenom: 'Dr Maha',
                    nom: 'Mokrim',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/47.png',
                  ),
                  Customcard(
                    prenom: 'Dr khadija',
                    nom: 'Benchekroun',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/63.jpg',
                  ),
                  Customcard(
                    prenom: 'Dr Narjiss',
                    nom: 'Berrada',
                    desc: 'Spécialiste, secteur libéral, Rabat',
                    image: 'assets/groupe/17.jpg',
                  ),
                  Customcard(
                    prenom: 'Dr Kawtar',
                    nom: 'El hassani',
                    desc: 'Spécialiste, secteur libéral, Rabat',
                    image: 'assets/groupe/59.png',
                  ),
                  Customcard(
                    prenom: 'Dr Halima',
                    nom: 'Abahssaine',
                    desc: 'Spécialiste, France',
                    image: 'assets/groupe/16.jpg',
                  ),
                  Customcard(
                    prenom: 'Dr Saad',
                    nom: 'Laanaz',
                    desc: 'Spécialiste, CHR, Rabat',
                    image: 'assets/groupe/64.jpg',
                  ),
                  Customcard(
                    prenom: 'Dr Fatima-Zahra',
                    nom: 'Zakkouri',
                    desc: 'Spécialiste, secteur libéral, Rabat',
                    image: 'assets/groupe/42.png',
                  ),
                  _buildSectionTitle("COMITE DE LECTURE"),
                  Customcard(
                    prenom: 'Pr Hassan',
                    nom: 'Errihani',
                    desc: 'Chef de service, INO, Rabat',
                    image: 'assets/groupe/1.jpg',
                  ),
                  Customcard(
                    prenom: 'Pr Hind',
                    nom: 'Mrabti',
                    desc: 'Professeur de l’enseignement supérieur, INO, Rabat',
                    image: 'assets/groupe/2.jpg',
                  ),
                  Customcard(
                    prenom: 'Pr Ibrahim',
                    nom: 'El Ghissassi',
                    desc: 'Professeur de l’enseignement supérieur, INO, Rabat',
                    image: 'assets/groupe/5.png',
                  ),
                  Customcard(
                    prenom: 'Pr Saber',
                    nom: 'Boutayeb',
                    desc: 'Professeur de l’enseignement supérieur, INO, Rabat',
                    image: 'assets/groupe/6.png',
                  ),
                  Customcard(
                    prenom: 'Pr Sarah',
                    nom: 'Naciri',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/22.png',
                  ),
                  Customcard(
                    prenom: 'Pr Hanane',
                    nom: 'Inrhaouen',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/29.png',
                  ),
                  Customcard(
                    prenom: 'Pr Siham',
                    nom: 'Lkhoyaali',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/46.png',
                  ),
                  Customcard(
                    prenom: 'Pr Salma',
                    nom: 'Najem',
                    desc: 'Professeur Assistant, INO, Rabat',
                    image: 'assets/groupe/56.png',
                  ),
                  Customcard(
                    prenom: 'Dr Hind',
                    nom: 'El yacoubi',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/41.png',
                  ),
                  Customcard(
                    prenom: 'Dr Asmae',
                    nom: 'Lakhdissi',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/49.png',
                  ),
                  Customcard(
                    prenom: 'Dr Maha',
                    nom: 'Mokrim',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/47.png',
                  ),

                  Customcard(
                    prenom: 'Dr khadija',
                    nom: 'Benchekroun',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/63.jpg',
                  ),
                  Customcard(
                    prenom: 'Dr chaimae',
                    nom: 'Abdi',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/61.jpg',
                  ),
                  Customcard(
                    prenom: 'Dr soukaina',
                    nom: 'Bekkouche',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/60.jpg',
                  ),
                  Customcard(
                    prenom: 'Dr Widad',
                    nom: 'Nadir',
                    desc: 'Spécialiste, INO, Rabat',
                    image: 'assets/groupe/62.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w900,
          color: const Color(0xFF0e1763),
        ),
      ),
    );
  }
}
