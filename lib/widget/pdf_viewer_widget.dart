// lib/widgets/pdf_viewer_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class PdfViewerWidget extends StatefulWidget {
  final String assetPath;

  const PdfViewerWidget({super.key, required this.assetPath});

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  String? _localPath;
  bool _isLoading = true;
  //int _totalPages = 0;
  //int _currentPage = 0;
  // ignore: unused_field
  late PDFViewController _controller;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final byteData = await rootBundle.load(widget.assetPath);
      final buffer = byteData.buffer;
      final dir = await getApplicationDocumentsDirectory();
      final fileName = widget.assetPath.split('/').last;
      final file = File('${dir.path}/$fileName');

      await file.writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );

      setState(() {
        _localPath = file.path;
        _isLoading = false;
      });
    } catch (e) {
      //print("Erreur PDF: $e");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_localPath == null) {
      return const Center(child: Text("PDF non chargé"));
    }

    return Column(
      children: [
        // PDF Viewer
        Expanded(
          child: PDFView(
            filePath: _localPath!,
            swipeHorizontal: false, // TOUJOURS vertical
            autoSpacing: false,
            pageFling: false,
            pageSnap: true,
            fitPolicy: FitPolicy.WIDTH,
            //onRender: (pages) => setState(() => _totalPages = pages ?? 0),
            onViewCreated: (controller) => _controller = controller,
            /*onPageChanged: (page, total) {
              setState(() => _currentPage = page ?? 0);
            },*/
            onError: (error) => debugPrint("Erreur PDF: $error"),
          ),
        ),

        // Indicateur de page TOUJOURS visible
        /*Container(
          padding: const EdgeInsets.all(8),
          color: Colors.grey[100],
          child: Center(
            child: Text(
              "Page ${_currentPage + 1} / $_totalPages",
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ),*/
      ],
    );
  }
}
