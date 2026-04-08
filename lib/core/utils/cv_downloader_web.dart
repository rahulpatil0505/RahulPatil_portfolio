// Web implementation — only compiled on web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/services.dart';

Future<void> downloadCvOnWeb(String assetPath) async {
  // Load the PDF bytes from Flutter assets
  final byteData = await rootBundle.load(assetPath);
  final bytes = byteData.buffer.asUint8List();

  // Create a Blob and trigger browser download
  final blob = html.Blob([bytes], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);

  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', 'Rahul_Patil_Resume.pdf')
    ..click();

  html.Url.revokeObjectUrl(url);
}