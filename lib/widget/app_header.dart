import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? assetGif;
  final Color? backgroundColor;
  final Color textColor;

  const AppHeader({
    super.key,
    required this.title,
    this.assetGif,
    this.backgroundColor = const Color(0xFF0e1763),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmallScreen = width < 360;
    final isTablet = width > 600; 

    // 🔥 HNA L-MOCHKIL T7EL: N9esna l-hauteur dyal l-iPad l 90.h bach ytjm3 dak l-faragh z-zre9
    double headerHeight = isTablet ? 90.h : (isSmallScreen ? 125.h : 145.h);

    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: isSmallScreen ? 40.w : 20.w, 
        // Hbetna l-contenu dyal l-header chwia l-te7t f l-iPad bach mayls9ch f s9ef
        top: isTablet ? 15.h : 0, 
      ),
      width: double.infinity,
      height: headerHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, "homepage"), 
                child: Padding(
                  padding: EdgeInsets.only(top: isTablet ? 5.h : 0),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: textColor,
                    // 🔥 N9esna l-icone l 12.sp f l-iPad (kat3ti nfss l-7ejm dyal 24 f tilifon)
                    size: isTablet ? 12.sp : (isSmallScreen ? 22.sp : 28.sp),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                if (assetGif != null)
                  Image.asset(
                    assetGif!,
                    // 🔥 N9esna size dyal l'image f l-iPad
                    width: isTablet ? 18.w : (isSmallScreen ? 35.w : 45.w),
                    height: isTablet ? 18.w : (isSmallScreen ? 35.w : 45.w),
                  ),

                if (assetGif != null)
                  SizedBox(height: isTablet ? 2.h : (isSmallScreen ? 6.h : 10.h)),

                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor,
                    // 🔥 12.sp f l-iPad hiya li ghat3ti l-3bar l-mtwazen bla maytfrg3
                    fontSize: isTablet ? 12.sp : (isSmallScreen ? 16.sp : 24.sp), 
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}