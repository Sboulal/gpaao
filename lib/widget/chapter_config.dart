class ChapterConfig {
  final String title;
  final String image;
  final List<Map<String, String>> menu;
  final String? subtitle;

  ChapterConfig({
    required this.title,
    required this.image,
    required this.menu,
    this.subtitle,
  });
}
