import 'package:amfrom_app/pages/dynamique.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../data/chapters.dart';
import 'package:amfrom_app/widget/app_header.dart';
import 'package:amfrom_app/widget/white_content_container.dart';

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
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
    final isSmall = MediaQuery.of(context).size.width < 360;

    return Scaffold(
      backgroundColor: const Color(0xFF0e1763),
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: "GUIDE", assetGif: 'assets/icons/5.gif'),

            WhiteContentContainer(
              topRadius: 60,
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmall ? 10.w : 15.w,
                  vertical: 20.h,
                ),
                children: [
                  Guideitem(
                    routeName: "sein",
                    title: "CANCERS DU SEIN",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: 'assets/banners/ban1.png',
                    config: Chapters.sein,
                    color: Color(0xFFCA0570),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: "sein",
                    title: "CANCERS GYNÉCOLOGIQUES",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: 'assets/banners/ban2.png',
                    config: Chapters.gyne,
                    color: Color(0xFF16afbf),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: 'dige',
                    title: "CANCERS DIGESTIFS",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: 'assets/banners/ban9.png',
                    config: Chapters.dige,
                    color: Color(0xFF732b97),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: "thora",
                    title: "CANCERS THORACIQUES",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: "assets/banners/ban3.png",
                    config: Chapters.thora,
                    color: Color(0xFFdc6b57),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: "orl",
                    title: "TUMEURS ORL",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: 'assets/banners/ban4.png',
                    config: Chapters.orl,
                    color: Color(0xFFba245f),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: "sarc",
                    title: "SARCOMES",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: 'assets/banners/ban5.png',
                    config: Chapters.sarc,
                    color: Color(0xFFd6b10f),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: "urolo",
                    title: "CANCERS UROLOGIQUES",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: 'assets/banners/ban6.png',
                    config: Chapters.urolo,
                    color: Color(0xFF2b85dc),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: "cuta",
                    title: "CANCERS CUTANÉS",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: 'assets/banners/ban7.png',
                    config: Chapters.cuta,
                    color: Color(0xFF303a56),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: "cere",
                    title: "TUMEURS CÉRÉBRALES",
                    subtitle: "Protocoles thérapeutiques des",
                    imagePath: 'assets/banners/ban10.png',
                    config: Chapters.cere,
                    color: Color(0xFF838788),
                    isSmall: isSmall,
                  ),

                  Guideitem(
                    routeName: "soin",
                    title: "SOINS DE SUPPORT",
                    subtitle: "",
                    imagePath: 'assets/banners/ban8.png',
                    config: Chapters.supo,
                    color: Color(0xFFe8555d),
                    isSmall: isSmall,
                  ),

                  SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Guideitem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String routeName;
  final Color color;
  final ChapterConfig config;
  final bool isSmall;

  const Guideitem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.routeName,
    required this.config,
    required this.color,
    required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DynamicChapterPage(config: config)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: isSmall ? 70.h : 80.h,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              width: isSmall ? 80.w : 100.w,
              height: double.infinity,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: isSmall ? 50.w : 60.w,
                  height: isSmall ? 50.h : 60.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(width: 10.w),

            Expanded(
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.r,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      subtitle,
                      maxLines: 1,
                      minFontSize: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Zain",
                        color: Colors.grey,
                        fontSize: isSmall ? 12 : 16,
                      ),
                    ),

                    AutoSizeText(
                      title,
                      maxLines: 1,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Zain",
                        color: color,
                        fontSize: isSmall ? 16 : 20,
                        fontWeight: FontWeight.w900,
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
