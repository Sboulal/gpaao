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
    final isSmallScreen = MediaQuery.of(context).size.width < 360;
    return Container(
      padding: EdgeInsets.only(
        //top: 40.h,
        left: 20.w,
        right: isSmallScreen ? 40.w : 20.w, // 🔥 FIX IMPORTANT
        //bottom: 10.h,
      ),
      width: double.infinity,
      height: isSmallScreen ? 125.h : 145.h, // 🔥 réduit sur petits écrans
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: LinearGradient(colors: [backgroundColor!, backgroundColor!]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, "homepage"),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: textColor,
                  size: isSmallScreen ? 22.sp : 28.sp,
                ),
              ),
              const Spacer(),
            ],
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (assetGif != null)
                  Image.asset(
                    assetGif!,
                    width: isSmallScreen ? 35.w : 45.w,
                    height: isSmallScreen ? 35.w : 45.w,
                  ),

                if (assetGif != null)
                  SizedBox(width: isSmallScreen ? 8.w : 12.w),

                SizedBox(height: isSmallScreen ? 6.h : 10.h),
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontSize: isSmallScreen ? 16.sp : 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
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
