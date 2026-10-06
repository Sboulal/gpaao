import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

// Les imports dyal l-widgets dyalk
import 'package:amfrom_app/widget/app_header.dart';
import 'package:amfrom_app/widget/white_content_container.dart';

class CalculatricePage extends StatefulWidget {
  const CalculatricePage({super.key});

  @override
  State<CalculatricePage> createState() => _CalculatricePageState();
}

class _CalculatricePageState extends State<CalculatricePage> {
  final TextEditingController _poidsController = TextEditingController();
  final TextEditingController _tailleController = TextEditingController();
  String _resultatBSA = "";

  @override
  void initState() {
    super.initState();
    // Bhal les pages lakhrin bach ib9a l-status bar m9add
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  // Fonction li kat7seb l-BSA
  void _calculerBSA() {
    String poidsText = _poidsController.text.replaceAll(',', '.');
    String tailleText = _tailleController.text.replaceAll(',', '.');

    double? poids = double.tryParse(poidsText);
    double? taille = double.tryParse(tailleText);

    if (poids != null && taille != null && poids > 0 && taille > 0) {
      double bsa = sqrt((poids * taille) / 3600);
      setState(() {
        _resultatBSA = "${bsa.toStringAsFixed(2)} m²";
      });
      FocusScope.of(context).unfocus();
    } else {
      setState(() {
        _resultatBSA = "Erreur: Valeurs invalides";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Hna rjje3na Scaffold f blasset Container
    return Scaffold(
      backgroundColor: const Color(0xFF0e1763), 
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER =================
            const AppHeader(
              title: "OUTILS CLINIQUES", 
              assetGif: 'assets/icons/5.gif' 
            ),

            // ================= CONTENU (L-CALCULATRICE) =================
            Expanded( 
              child: WhiteContentContainer(
                topRadius: 60,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
                  children: [
                    Text(
                      "Calcul de la Surface Corporelle (BSA)",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0E1763),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Basé sur la formule de Mosteller. Cet outil est conçu pour faciliter le calcul des doses d'anticancéreux.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                        height: 1.3,
                      ),
                    ),
                    
                    SizedBox(height: 35.h),
                    
                    // INPUT POIDS
                    TextField(
                      controller: _poidsController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: "Poids (en kg)",
                        labelStyle: const TextStyle(color: Color(0xFF0E1763)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Color(0xFF0E1763), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        prefixIcon: const Icon(Icons.monitor_weight_outlined, color: Color(0xFF0E1763)),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    
                    SizedBox(height: 16.h),
                    
                    // INPUT TAILLE
                    TextField(
                      controller: _tailleController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: "Taille (en cm)",
                        labelStyle: const TextStyle(color: Color(0xFF0E1763)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Color(0xFF0E1763), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        prefixIcon: const Icon(Icons.height, color: Color(0xFF0E1763)),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    
                    SizedBox(height: 30.h),
                    
                    // BOUTON CALCULER
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0E1763),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 5,
                          shadowColor: const Color(0xFF0E1763).withOpacity(0.4),
                        ),
                        onPressed: _calculerBSA,
                        child: Text(
                          "Calculer le BSA",
                          style: TextStyle(
                            fontSize: 16.sp, 
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 35.h),
                    
                    // AFFICHAGE DU RÉSULTAT
                    if (_resultatBSA.isNotEmpty)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: _resultatBSA.contains("Erreur") 
                              ? Colors.red.shade50 
                              : const Color(0xFFF3F7FF),
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: _resultatBSA.contains("Erreur") 
                                ? Colors.red.shade200 
                                : const Color(0xFFE3ECFF),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              _resultatBSA.contains("Erreur") ? "Attention" : "Résultat",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: _resultatBSA.contains("Erreur") 
                                    ? Colors.red 
                                    : Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              _resultatBSA,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: _resultatBSA.contains("Erreur") ? 18.sp : 28.sp,
                                fontWeight: FontWeight.w900,
                                color: _resultatBSA.contains("Erreur") 
                                    ? Colors.red 
                                    : const Color(0xFF0E1763),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    SizedBox(height: 100.h), 
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