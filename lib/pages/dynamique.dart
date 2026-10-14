// ignore_for_file: deprecated_member_use

import 'package:amfrom_app/data/menuConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amfrom_app/widget/menu.dart';
import 'package:amfrom_app/data/chapters.dart';
import 'package:shared_preferences/shared_preferences.dart'; // <--- Zidna l-import hna

class DynamicChapterPage extends StatefulWidget {
  final ChapterConfig config;

  const DynamicChapterPage({super.key, required this.config});

  @override
  State<DynamicChapterPage> createState() => _DynamicChapterPageState();
}

class _DynamicChapterPageState extends State<DynamicChapterPage> {
  bool isFavorite = false; // <--- Variable bach n3erfo wach m-sauvegarder wla la

  @override
  void initState() {
    super.initState();
    _checkIfFavorite(); // <--- Kan9elbo wach had l-page deja f favoris mli kat-t7el

    if (widget.config.pdfPath != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        Navigator.pushReplacementNamed(
          context,
          'pdfMenu',
          arguments: MenuConfig(
            title: widget.config.title,
            pdfPath: widget.config.pdfPath!,
            backRoute: widget.config.route,
            color: widget.config.color,
          ),
        );
      });
    }
  }

  // ================= LOGIQUE DYAL FAVORIS =================
  Future<void> _checkIfFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favs = prefs.getStringList('favoris') ?? [];
    setState(() {
      isFavorite = favs.contains(widget.config.title); // Kan-sauvegardew b l-title (ex: "CANCERS DU SEIN")
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favs = prefs.getStringList('favoris') ?? [];

    if (isFavorite) {
      favs.remove(widget.config.title); // Ila kan, kan7iydoh
    } else {
      favs.add(widget.config.title); // Ila makanch, kanzidoh
    }

    await prefs.setStringList('favoris', favs); // Kan-enregistriw f t-tilifon

    setState(() {
      isFavorite = !isFavorite;
    });

    // Message sghir kitle3 l-te7t (SnackBar)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorite ? "Ajouté aux favoris" : "Retiré des favoris"),
        backgroundColor: widget.config.color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
  // =======================================================

  @override
  Widget build(BuildContext context) {
    if (widget.config.menus.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0xFF0a1d59),
          ),
        ),
      );
    }

    final isSmallScreen = MediaQuery.of(context).size.width < 360;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: FractionalOffset(0.0, 0.2),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 40.h,
                left: 20.w,
                right: 20.w,
                bottom: 10.h,
              ),
              child: Column(
                children: [
                  // ================= HEADER M3A BOUTON FAVORIS =================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // <--- Bach nfar9ohom
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: widget.config.color,
                          size: 30.sp,
                        ),
                      ),
                      // L-bouton jdid dyal Favoris li zedna
                      InkWell(
                        onTap: _toggleFavorite,
                        child: Icon(
                          isFavorite ? Icons.bookmark : Icons.bookmark_border, // Kyt3mer ila kan f favoris
                          color: widget.config.color,
                          size: 32.sp,
                        ),
                      ),
                    ],
                  ),
                  // ==============================================================

                  SizedBox(height: 10.h),

                  /// HEADER RESPONSIVE
                  isSmallScreen
                      ? Column(
                          children: [
                            Image.asset(
                              widget.config.image,
                              width: 70.w,
                              height: 70.w,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 10.h),
                            if (widget.config.subtitle != null)
                              Text(
                                widget.config.subtitle!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            Text(
                              widget.config.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: widget.config.color,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (widget.config.subtitle != null)
                                    Text(
                                      widget.config.subtitle!,
                                      textAlign: TextAlign.left,
                                    ),
                                  Text(
                                    widget.config.title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: widget.config.color,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Image.asset(
                              widget.config.image,
                              width: 80.w,
                              height: 80.w,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: widget.config.color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60.r),
                  ),
                ),
                child: ListView(
                  children: widget.config.menus
                      .map(
                        (menu) => Menu(
                          title: menu['title']!,
                          routeName: 'pdfMenu',
                          args: MenuConfig(
                            title: menu['title']!,
                            pdfPath: menu['pdf']!,
                            backRoute: widget.config.route,
                            color: widget.config.color,
                          ),
                          colorC: widget.config.color,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}