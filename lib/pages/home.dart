// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amfrom_app/pages/MainNavigation.dart';
import 'package:amfrom_app/pages/calculatrice_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

@override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isTablet = size.width > 600;
    final isSmall = size.height < 700;

    return Scaffold(
      backgroundColor: const Color(0xFF081859),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF081859), Color(0xFF142A8C)],
          ),
        ),
        child: Column(
          children: [
            // ================= BANNIERE =================
            Container(
              width: double.infinity,
              // N9asna mn l'hauteur dyal l'image bach matakhodch espace kbir
              height: isTablet
                  ? MediaQuery.of(context).size.height * 0.25
                  : MediaQuery.of(context).size.height *
                        (isSmall ? 0.18 : 0.20),
              padding: EdgeInsets.only(top: 30.h, left: 0.w, right: 0.w), // N9asna l-padding l-fo9
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/ban.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            // ================= CONTENU =================
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60.r),
                  ),
                ),
                child: Stack(
                  children: [
                    // BACKGROUND ADN
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.08,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.only(
                            topRight: Radius.circular(60.r),
                          ),
                          child: Image.asset(
                            'assets/images/homebg.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // SCROLL UNIQUE
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: isSmall ? 8.h : 10.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),

                          Text(
                            "Bienvenue",
                            style: TextStyle(
                              fontSize: isSmall ? 22.sp : 26.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0E1763),
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Text(
                            "Choisissez une rubrique",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Container(
                            width: 45.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0E1763),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          SizedBox(height: 12.h), // N9asna mn l-espace

                          // ================= GRID =================
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.w, // N9asna l-espace bin mrab3at
                                  mainAxisSpacing: isSmall ? 8.h : 10.h,
                                  // Kberna l-aspect ratio bach iwliw l-mrab3at 9sar f t-toul w i3t9o l-espace
                                  childAspectRatio: isSmall ? 1.05 : 1.15,
                                ),
                            itemBuilder: (context, index) {
                              final items = [
                                const CustomGrid(
                                  asset: "assets/icons/2.gif",
                                  page: 0,
                                  label: "Editorial",
                                ),
                                const CustomGrid(
                                  asset: "assets/icons/3.gif",
                                  page: 1,
                                  label: "Comité",
                                ),
                                const CustomGrid(
                                  asset: "assets/icons/4.gif",
                                  page: 2,
                                  label: "Groupe de travail",
                                ),
                                const CustomGrid(
                                  asset: "assets/icons/5.gif",
                                  page: 3,
                                  label: "Guide",
                                ),
                              ];
                              return items[index];
                            },
                          ),

                          // ================= NOUVELLE SECTION : OUTILS / CALCULATRICE =================
                          SizedBox(height: 12.h), 
                          
                          InkWell(
                            borderRadius: BorderRadius.circular(14.r),
onTap: () {
  // Hna kanmchiw l MainNavigation b initialPage = 4 (li hiya Calculatrice)
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const MainNavigation(initialPage: 4)),
  );
},
                            child: Container(
                              width: double.infinity,
                              // N9asna mn l-padding l-dakhlani dyal l-bouton
                              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0E1763),
                                borderRadius: BorderRadius.circular(14.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.15),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.calculate_outlined, 
                                      color: Colors.white, 
                                      size: 24.sp, // Sgharna chwia l'icone
                                    ),
                                  ),
                                  
                                  SizedBox(width: 15.w),
                                  
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Outils Cliniques",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          "Calcul de BSA, Clairance, etc.",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.white.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  Icon(
                                    Icons.arrow_forward_ios, 
                                    color: Colors.white, 
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 12.h),

                          // ================= LOGO & VERSION =================
                          Center(
                            child: Image.asset(
                              "assets/images/logoamfrom.png",
                              height: isSmall ? 28.h : 35.h, // Sgharna l-logo chwia
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Center(
                            child: Text(
                              "Version 1.0 : juin 2026",
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),

                          SizedBox(height: 15.h), // 7ayedna l-espace l-kbir li kan flkher (40.h)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CustomGrid extends StatelessWidget {
  final int page;
  final String asset;
  final String label;

  const CustomGrid({
    super.key,
    required this.page,
    required this.asset,
    required this.label,
  });

  String getDescription() {
    switch (label) {
      case "Editorial":
        return "Consultez l'éditorial et le mot du président";
      case "Comité":
        return "Découvrez les membres du comité scientifique";
      case "Groupe de travail":
        return "Accédez aux groupes de travail";
      case "Guide":
        return "Consultez le guide \n GPAAO";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MainNavigation(initialPage: page)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.w), // N9asna padding mn 12 l 8
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: const Color(0xFFE3ECFF)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44.w, // Sgharna l-icone mn 55 l 44
              height: 44.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF3F7FF),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0E1763).withOpacity(0.20),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w), // Sgharna padding d-l'icone mn 15 l 10
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF0E1763),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(asset),
                ),
              ),
            ),

            SizedBox(height: 6.h), // N9asna l-espace

            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp, // Sgharna l-font mn 16 l 14
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0E1763),
              ),
            ),

            SizedBox(height: 2.h), // N9asna l-espace

            Text(
              getDescription(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 9.sp, // Sgharna l-font mn 10 l 9
                color: Colors.grey.shade700,
                height: 1.2, // N9asna l-hauteur de ligne
              ),
            ),
          ],
        ),
      ),
    );
  }
}