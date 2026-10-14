import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amfrom_app/widget/app_header.dart';
import 'package:amfrom_app/widget/white_content_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/chapters.dart';
import 'package:amfrom_app/pages/guide.dart'; // Darouri bach n-utilisiw Guideitem

class FavorisPage extends StatefulWidget {
  const FavorisPage({super.key});

  @override
  State<FavorisPage> createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
  List<Map<String, dynamic>> savedCategories = [];
  bool isLoading = true;

  // L-liste globale dyal ga3 les chapitres
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
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favs = prefs.getStringList('favoris') ?? [];
    
    // Kan-gheneriew l-liste jdida li fiha ghir li f favoris
    List<Map<String, dynamic>> tempSaved = [];
    for (var cat in allCategories) {
      if (favs.contains(cat["title"])) {
        tempSaved.add(cat);
      }
    }

    setState(() {
      savedCategories = tempSaved;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 360;

    return Container(
      color: const Color(0xFF0e1763),
      child: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              title: "MES FAVORIS", 
              assetGif: 'assets/icons/5.gif' 
            ),

            Expanded(
              child: WhiteContentContainer(
                topRadius: 60,
                child: isLoading 
                ? const Center(child: CircularProgressIndicator(color: Color(0xFF0e1763)))
                : savedCategories.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            size: 80.sp,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            "Aucun protocole sauvegardé",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0E1763),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Text(
                              "Vos protocoles favoris apparaîtront ici pour un accès rapide.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade500,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmall ? 10.w : 15.w,
                        vertical: 20.h,
                      ),
                      itemCount: savedCategories.length,
                      itemBuilder: (context, index) {
                        final cat = savedCategories[index];
                        return Guideitem( // Kanderi appel l nfs l-widget dyal l-Guide
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
            ),
          ],
        ),
      ),
    );
  }
}