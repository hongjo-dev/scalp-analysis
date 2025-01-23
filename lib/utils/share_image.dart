import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

Future<void> shareAnalysisResult(GlobalKey globalKey) async {
  try {
    // Wait briefly to ensure the widget is fully rendered before capturing
    await Future.delayed(Duration(milliseconds: 500));

    final imageBytes = await capturePng(globalKey);
    final directory = (await getApplicationDocumentsDirectory()).path;
    File imgFile = File('$directory/screenshot.png');

    await imgFile.writeAsBytes(imageBytes);

    // Sharing the captured screenshot
    Share.shareXFiles([XFile('$directory/screenshot.png')], text: 'Sharing the analysis result and images.');
  } catch (e) {
    print("An error occurred while sharing the image: $e");
  }
}

Future<Uint8List> capturePng(GlobalKey globalKey) async {
  RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}
