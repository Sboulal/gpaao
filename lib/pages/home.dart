// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amfrom_app/pages/MainNavigation.dart';

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
      backgroundColor: Color(0xFF081859),
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
                  ? MediaQuery.of(context).size.height * 0.32
                  : MediaQuery.of(context).size.height *
                        (isSmall ? 0.24 : 0.28),
              padding: EdgeInsets.only(top: 40.h, left: 0.w, right: 0.w),
              child: Column(
                children: [
                  // Image Bannière avec arrondi
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

                  SizedBox(height: 12.h),
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
                              fontSize: isSmall ? 24.sp : 28.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0E1763),
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            "Choisissez une rubrique",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          Container(
                            width: 45.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0E1763),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          SizedBox(height: isSmall ? 5.h : 0.h),

                          // ================= GRID =================
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15.w,
                                  mainAxisSpacing: isSmall ? 10.h : 14.h,
                                  childAspectRatio: isSmall ? 0.95 : 1,
                                ),
                            itemBuilder: (context, index) {
                              final items = [
                                CustomGrid(
                                  asset: "assets/icons/2.gif",
                                  page: 0,
                                  label: "Editorial",
                                ),
                                CustomGrid(
                                  asset: "assets/icons/3.gif",
                                  page: 1,
                                  label: "Comité",
                                ),
                                CustomGrid(
                                  asset: "assets/icons/4.gif",
                                  page: 2,
                                  label: "Groupe de travail",
                                ),
                                CustomGrid(
                                  asset: "assets/icons/5.gif",
                                  page: 3,
                                  label: "Guide",
                                ),
                              ];
                              return items[index];
                            },
                          ),

                          //SizedBox(height: 9.h),
                          Center(
                            child: Image.asset(
                              "assets/images/logoamfrom.png",
                              height: isSmall ? 32.h : 40.h,
                            ),
                          ),

                          SizedBox(height: 6.h),

                          Center(
                            child: Text(
                              "Version 1.0 : juin 2026",
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),
                          SizedBox(height: 20.h),
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
        padding: EdgeInsets.all(12.w),
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
              width: 55.w,
              height: 55.w,
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
                padding: EdgeInsets.all(15.w),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF0E1763),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(asset),
                ),
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0E1763),
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              getDescription(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey.shade700,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
