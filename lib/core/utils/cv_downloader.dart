import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Conditional import: dart:html on web, stub on mobile/desktop
import 'cv_downloader_stub.dart'
    if (dart.library.html) 'cv_downloader_web.dart';

/// Call this from any widget to trigger CV download.
/// On web  → downloads directly via browser.
/// On mobile → saves to Downloads / Documents and shows a SnackBar.
Future<void> downloadCv(BuildContext context) async {
  const assetPath = 'assets/pdf/Rahul_Patil_Resume.pdf';

  try {
    if (kIsWeb) {
      // ── Web: browser download — do not touch ──────────────────────────
      await downloadCvOnWeb(assetPath);
    } else {
      // ── Mobile: copy asset to temp file, open with system viewer ──────
      final byteData = await rootBundle.load(assetPath);
      final bytes = byteData.buffer.asUint8List();

      // Use temp directory so no storage permission is needed
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/Rahul_Patil_Resume.pdf');
      await file.writeAsBytes(bytes, flush: true);

      // Open with whatever PDF app the user has installed
      final result = await OpenFile.open(file.path);

      if (result.type != ResultType.done && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ' No PDF viewer found: ${result.message}',
              style: const TextStyle(fontFamily: 'Courier'),
            ),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ' Could not open resume: $e',
            style: const TextStyle(fontFamily: 'Courier'),
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }
}
