import 'dart:ui';

class ChapterConfig {
  final String title;
  final String? subtitle;
  final String image;
  final String route;
  final List<Map<String, String>> menus;
  final String? pdfPath;
  final Color color;

  ChapterConfig({
    required this.title,
    required this.image,
    required this.route,
    required this.menus,
    this.subtitle,
    this.pdfPath,
    required this.color,
  });
}

class Chapters {
  static final sein = ChapterConfig(
    title: "CANCERS DU SEIN",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban1.png",
    route: "sein",
    color: Color(0xFFba245f),
    menus: [
      {
        "title": "A- Cancer du sein HER 2 positif",
        "pdf": "assets/pdf/sein/a.pdf",
        "image": "assets/banners/ban1.png",
      },
      {
        "title": "B- Triple négatif",
        "pdf": "assets/pdf/sein/b.pdf",
        "image": "assets/banners/ban1.png",
      },
      {
        "title": "C- Cancer du sein RH positif",
        "pdf": "assets/pdf/sein/c.pdf",
        "image": "assets/banners/ban1.png",
      },
    ],
  );

  static final gyne = ChapterConfig(
    title: "CANCERS GYNÉCOLOGIQUES",
    route: "gyne",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban2.png",
    color: Color(0xFF16afbf),
    menus: [
      {
        "title": "A- Cancers épithéliaux de l’ovaire",
        "pdf": "assets/pdf/gyn/a.pdf",
      },
      {"title": "B- Cancers rares de l’ovaire", "pdf": "assets/pdf/gyn/b.pdf"},
      {"title": "C- Cancer du col utérin", "pdf": "assets/pdf/gyn/c.pdf"},
      {"title": "D- Cancers de l’endomètre", "pdf": "assets/pdf/gyn/d.pdf"},
      {"title": "E- Cancer du vagin", "pdf": "assets/pdf/gyn/e.pdf"},
      {"title": "F- Cancer de la vulve", "pdf": "assets/pdf/gyn/f.pdf"},
      {
        "title": "G- Les maladies trophoblastiques persistantes",
        "pdf": "assets/pdf/gyn/g.pdf",
      },
    ],
  );

  static final dige = ChapterConfig(
    title: "CANCERS DIGESTIFS",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban9.png",
    route: "dig",
    color: Color(0xFF732b97),
    menus: [
      {"title": "A- Cancer colorectal", "pdf": "assets/pdf/dige/a.pdf"},
      {"title": "B- Cancer de l’estomac", "pdf": "assets/pdf/dige/b.pdf"},
      {"title": "C- Cancer de l’œsophage", "pdf": "assets/pdf/dige/c.pdf"},
      {"title": "D- Cancers du canal anal", "pdf": "assets/pdf/dige/d.pdf"},
      {
        "title": "E- Carcinome hépatocellulaire",
        "pdf": "assets/pdf/dige/e.pdf",
      },
      {
        "title": "F- GIST : tumeurs stromales gastro-intestinales",
        "pdf": "assets/pdf/dige/f.pdf",
      },
      {"title": "G- Cancers du pancréas", "pdf": "assets/pdf/dige/g.pdf"},
      {"title": "H- Tumeurs neuroendocrines", "pdf": "assets/pdf/dige/h.pdf"},
      {
        "title": "I- Cancers des voies biliaires",
        "pdf": "assets/pdf/dige/i.pdf",
      },
    ],
  );

  static final thora = ChapterConfig(
    title: "CANCERS THORACIQUES",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban3.png",
    route: "thora",
    color: Color(0xFFdc6b57),
    menus: [
      {
        "title": "A- Cancers pulmonaires non à petites cellules",
        "pdf": "assets/pdf/thora/a.pdf",
      },
      {
        "title": "B- Cancers pulmonaires à petites cellules",
        "pdf": "assets/pdf/thora/b.pdf",
      },
      {"title": "C- Mesothéliomes", "pdf": "assets/pdf/thora/c.pdf"},
      {
        "title": "D- Thymomes et carcinomes thymiques",
        "pdf": "assets/pdf/thora/d.pdf",
      },
    ],
  );

  static final orl = ChapterConfig(
    title: "TUMEURS ORL",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban4.png",
    route: "orl",
    color: Color(0xFFba245f),
    menus: [
      {
        "title": "A- Carcinomes épidermoïdes ORL",
        "pdf": "assets/pdf/orl/a.pdf",
      },
      {"title": "B- UCNT du cavum ", "pdf": "assets/pdf/orl/b.pdf"},
      {
        "title": "C- Cancers des glandes salivaires",
        "pdf": "assets/pdf/orl/c.pdf",
      },
      {"title": "D- Cancers de la thyroïde", "pdf": "assets/pdf/orl/d.pdf"},
    ],
  );
  static final sarc = ChapterConfig(
    title: "SARCOMES",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban5.png",
    route: "sarc",
    color: Color(0xFFd6b10f),
    menus: [
      {"title": "A- Sarcomes des tissus mous", "pdf": "assets/pdf/sarc/a.pdf"},
      {"title": "B- Ostéosarcomes", "pdf": "assets/pdf/sarc/b.pdf"},
      {"title": "C- Sarcomes d’Ewing", "pdf": "assets/pdf/sarc/c.pdf"},
    ],
  );

  static final urolo = ChapterConfig(
    title: "CANCERS UROLOGIQUES",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban6.png",
    route: "urolo",
    color: Color(0xFF2b85dc),
    menus: [
      {"title": "A- Cancers du rein", "pdf": "assets/pdf/urolo/a.pdf"},
      {
        "title": "B- Tumeurs germinales du testicule",
        "pdf": "assets/pdf/urolo/b.pdf",
      },
      {"title": "C- Cancer de la vessie", "pdf": "assets/pdf/urolo/c.pdf"},
      {"title": "D- Cancers de la prostate", "pdf": "assets/pdf/urolo/d.pdf"},
    ],
  );

  static final cuta = ChapterConfig(
    title: "CANCERS CUTANÉS",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban7.png",
    route: "cuta",
    color: Color(0xFF303a56),
    menus: [
      {"title": "A- Mélanome", "pdf": "assets/pdf/cuta/a.pdf"},
      {
        "title": "B- Carcinomes épidermoïdes cutanés",
        "pdf": "assets/pdf/cuta/b.pdf",
      },
    ],
  );

  static final cere = ChapterConfig(
    title: "TUMEURS CÉRÉBRALES",
    subtitle: "Protocoles thérapeutiques des",
    image: "assets/banners/ban10.png",
    route: "cere",
    color: Color(0xFF838788),
    menus: [],
    pdfPath: "assets/pdf/cere/a.pdf",
  );

  static final supo = ChapterConfig(
    title: "SOINS DE SUPPORT",
    subtitle: "",
    image: "assets/banners/ban8.png",
    route: "soin",
    color: Color(0xFFe8555d),
    menus: [
      {
        "title": "A- Les facteurs de croissance granulocytaires",
        "pdf": "assets/pdf/soin/a.pdf",
      },
      {"title": "B- L’érythropoïétine", "pdf": "assets/pdf/soin/b.pdf"},
      {
        "title": "C- Facteur de croissance plaquettaire",
        "pdf": "assets/pdf/soin/c.pdf",
      },
      {
        "title": "D- Traitement des métastases osseuses",
        "pdf": "assets/pdf/soin/d.pdf",
      },
    ],
  );
}
