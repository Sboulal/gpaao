// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MenuConfig {
  final String title;
  //final String image;
  final String pdfPath;
  final String backRoute;
  final Color color;

  MenuConfig({
    required this.title,

    required this.color,
    required this.pdfPath,
    required this.backRoute,
  });
}
