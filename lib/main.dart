import 'package:amfrom_app/data/menuConfig.dart';
import 'package:amfrom_app/pages/comite.dart';
import 'package:amfrom_app/pages/dynamic_menu_page.dart';
import 'package:amfrom_app/pages/editorial.dart';
import 'package:amfrom_app/pages/groupe.dart';
import 'package:amfrom_app/pages/guide.dart';
import 'package:amfrom_app/pages/home.dart';
import 'package:amfrom_app/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ← Important

  await ScreenUtil.ensureScreenSize(); // ← Ajout recommandé

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 786),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true, // ← Ajout recommandé
      builder: (context, child) {
        return MaterialApp(
          title: 'GUIDE AMFROM',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0e1763)),
          ),
          home: const Welcome(),
          routes: {
            'welcome': (context) => const Welcome(),
            'homepage': (context) => const Homepage(),
            'editorial': (context) => const Editorial(),
            'comite': (context) => const Comite(),
            'groupe': (context) => const Groupe(),
            'guide': (context) => const Guide(),
            'pdfMenu': (context) => DynamicMenuPage(
              menu: ModalRoute.of(context)!.settings.arguments as MenuConfig,
            ),
          },
        );
      },
    );
  }
}
