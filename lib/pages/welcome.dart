import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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

    final isTablet = size.shortestSide >= 600;
    final isSmallPhone = size.height < 700;

    String backgroundImage;

    if (isTablet) {
      backgroundImage = 'assets/images/welcom2.png';
    } else if (isSmallPhone) {
      backgroundImage = 'assets/images/welcom3.png';
    } else {
      backgroundImage = 'assets/images/welcom.png';
    }

    return Scaffold(
      body: Stack(
        children: [
          // 🌄 BACKGROUND
          Positioned.fill(
            child: Image.asset(backgroundImage, fit: BoxFit.fill),
          ),

          // 🔵 BUTTON EXACT POSITION (75% HEIGHT)
          Positioned(
            top: size.height * 0.75, // ⭐ 3/4 écran EXACT
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: SizedBox(
                width: double.infinity,
                height: isTablet
                    ? 72.h
                    : isSmallPhone
                    ? 52.h
                    : 58.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'homepage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0e1763),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    elevation: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ACCEDER",
                        style: TextStyle(
                          fontSize: isTablet ? 20.sp : 22.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Image.asset(
                        "assets/icons/fleche.gif",
                        width: isTablet ? 34.w : 38.w,
                        height: isTablet ? 34.h : 38.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
