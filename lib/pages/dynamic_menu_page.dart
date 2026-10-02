import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amfrom_app/widget/pdf_viewer_widget.dart';
import 'package:amfrom_app/data/menuConfig.dart';

class DynamicMenuPage extends StatelessWidget {
  final MenuConfig menu;

  const DynamicMenuPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 360;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Column(
          children: [
            // HEADER
            SafeArea(
              bottom: false,
              child: Container(
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 10.h,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    // BACK BUTTON
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: menu.color,
                            size: 26.sp,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    // TITLE (FIXED)
                    Center(
                      child: Text(
                        menu.title,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isSmall ? 15.sp : 20.sp,
                          color: menu.color,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // CONTENT
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: PdfViewerWidget(assetPath: menu.pdfPath),
              ),
            ),
          ],
        ),
      ),
    );
  }
}