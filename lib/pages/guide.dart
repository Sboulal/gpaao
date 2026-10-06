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
  // 1. Zidna Liste li jam3a ga3 les données dyal les catégories
  final List<Map<String, dynamic>> allCategories = [
    {"routeName": "sein", "title": "CANCERS DU SEIN", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban1.png', "config": Chapters.sein, "color": const Color(0xFFCA0570)},
    {"routeName": "gyne", "title": "CANCERS GYNÉCOLOGIQUES", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban2.png', "config": Chapters.gyne, "color": const Color(0xFF16afbf)},
    {"routeName": "dige", "title": "CANCERS DIGESTIFS", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban9.png', "config": Chapters.dige, "color": const Color(0xFF732b97)},
    {"routeName": "thora", "title": "CANCERS THORACIQUES", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban3.png', "config": Chapters.thora, "color": const Color(0xFFdc6b57)},
    {"routeName": "orl", "title": "TUMEURS ORL", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban4.png', "config": Chapters.orl, "color": const Color(0xFFba245f)},
    {"routeName": "sarc", "title": "SARCOMES", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban5.png', "config": Chapters.sarc, "color": const Color(0xFFd6b10f)},
    {"routeName": "urolo", "title": "CANCERS UROLOGIQUES", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban6.png', "config": Chapters.urolo, "color": const Color(0xFF2b85dc)},
    {"routeName": "cuta", "title": "CANCERS CUTANÉS", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban7.png', "config": Chapters.cuta, "color": const Color(0xFF303a56)},
    {"routeName": "cere", "title": "TUMEURS CÉRÉBRALES", "subtitle": "Protocoles thérapeutiques des", "imagePath": 'assets/banners/ban10.png', "config": Chapters.cere, "color": const Color(0xFF838788)},
    {"routeName": "soin", "title": "SOINS DE SUPPORT", "subtitle": "", "imagePath": 'assets/banners/ban8.png', "config": Chapters.supo, "color": const Color(0xFFe8555d)},
  ];

  // 2. Liste li ghadi tb9a t-afficha (kat-tbdl mli kanktbo)
  List<Map<String, dynamic>> displayedCategories = [];

  @override
  void initState() {
    super.initState();
    // F l-wla kan-affichiw kolchi
    displayedCategories = allCategories;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  // 3. Fonction dyal l-Filtrage (Recherche)
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // Ila kant l-barre khawya, werri koulchi
      results = allCategories;
    } else {
      // Ila ktabna chi 7aja, 9elleb f l-title
      results = allCategories
          .where((category) => category["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Actualiser l-interface
    setState(() {
      displayedCategories = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 360;

    return Scaffold(
      backgroundColor: const Color(0xFF0e1763),
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(title: "GUIDE", assetGif: 'assets/icons/5.gif'),
            
            WhiteContentContainer(
              topRadius: 60,
              child: Column(
                children: [
                  // ================= BARRE DE RECHERCHE =================
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 14.sp, color: const Color(0xFF0e1763)),
                        decoration: InputDecoration(
                          hintText: "Rechercher un protocole ou cancer...",
                          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13.sp),
                          prefixIcon: const Icon(Icons.search, color: Color(0xFF0e1763)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                        ),
                        onChanged: (value) => _runFilter(value), // Hna rbatnaha m3a l-fonction
                      ),
                    ),
                  ),

                  // ================= LISTE DES CATÉGORIES FILTRÉES =================
                  Expanded(
                    child: displayedCategories.isEmpty
                        ? Center(
                            child: Text(
                              "Aucun résultat trouvé",
                              style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: isSmall ? 10.w : 15.w,
                              vertical: 20.h,
                            ),
                            itemCount: displayedCategories.length,
                            itemBuilder: (context, index) {
                              final cat = displayedCategories[index];
                              return Guideitem(
                                routeName: cat["routeName"],
                                title: cat["title"],
                                subtitle: cat["subtitle"],
                                imagePath: cat["imagePath"],
                                config: cat["config"],
                                color: cat["color"],
                                isSmall: isSmall,
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Kheli l-Guideitem kima hia
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
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              width: isSmall ? 80.w : 100.w,
              height: double.infinity,
              decoration: BoxDecoration(
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
                      offset: const Offset(0, 3),
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