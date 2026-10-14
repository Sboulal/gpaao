// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amfrom_app/pages/MainNavigation.dart';
// 7iydna l-import dyal calculatrice_page

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
              height: isTablet
                  ? MediaQuery.of(context).size.height * 0.25
                  : MediaQuery.of(context).size.height *
                        (isSmall ? 0.18 : 0.20),
              padding: EdgeInsets.only(top: 30.h, left: 0.w, right: 0.w),
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

                          SizedBox(height: 12.h),

                          // ================= GRID =================
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: isSmall ? 8.h : 10.h,
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

                          // 7ayedna l-bouton dyal Outils Cliniques mn hna
                          SizedBox(height: 20.h),

                          // ================= LOGO & VERSION =================
                          Center(
                            child: Image.asset(
                              "assets/images/logoamfrom.png",
                              height: isSmall ? 28.h : 35.h,
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

                          SizedBox(height: 15.h), 
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
        padding: EdgeInsets.all(8.w),
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
              width: 44.w,
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
                padding: EdgeInsets.all(10.w),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF0E1763),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(asset),
                ),
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0E1763),
              ),
            ),

            SizedBox(height: 2.h),

            Text(
              getDescription(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 9.sp,
                color: Colors.grey.shade700,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}