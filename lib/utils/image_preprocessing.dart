import 'dart:isolate';
import 'dart:typed_data';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'dart:async';

class IsolateData {
  final String imagePath;
  final SendPort sendPort;
  final int inputWidth;
  final int inputHeight;
  final bool useFloat32;

  IsolateData(this.imagePath, this.sendPort, this.inputWidth, this.inputHeight, this.useFloat32);
}

Future<Uint8List> preprocessImage(String imagePath, {int inputWidth = 640, int inputHeight = 640, bool useFloat32 = true}) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_preprocessImageInIsolate, IsolateData(imagePath, receivePort.sendPort, inputWidth, inputHeight, useFloat32));
  final preprocessedImageData = await receivePort.first as Uint8List;
  return preprocessedImageData;
}

void _preprocessImageInIsolate(IsolateData isolateData) async {
  final imagePath = isolateData.imagePath;
  final sendPort = isolateData.sendPort;
  final inputWidth = isolateData.inputWidth;
  final inputHeight = isolateData.inputHeight;
  final useFloat32 = isolateData.useFloat32;

  final image = img.decodeImage(File(imagePath).readAsBytesSync())!;

  // 1. 중앙 부분만 크롭해서 정밀기계처럼 일정한 스케일 확보
  int cropSize = (image.width < image.height) ? image.width : image.height;
  // 예: 원본의 50% 영역만 중앙크롭 (필요하다면 비율 조정 가능)
  cropSize = (cropSize * 0.5).toInt();
  int startX = (image.width - cropSize) ~/ 2;
  int startY = (image.height - cropSize) ~/ 2;

  img.Image cropped = img.copyCrop(image, startX, startY, cropSize, cropSize);

  // 2. 조명/대비/채도 조정 (예: 대비 조금 올리고 채도 조금 낮추기)
  cropped = img.adjustColor(cropped, contrast: 1.2, saturation: 0.9);

  // 3. 모델 입력 크기로 리사이즈
  final resizedImg = img.copyResize(cropped, width: inputWidth, height: inputHeight);

  Uint8List preprocessedImageData;
  if (useFloat32) {
    preprocessedImageData = imageToFloat32(resizedImg, inputWidth, inputHeight);
  } else {
    preprocessedImageData = imageToUint8(resizedImg, inputWidth, inputHeight);
  }

  sendPort.send(preprocessedImageData);
}

Uint8List imageToFloat32(img.Image image, int width, int height) {
  var convertedBytes = Float32List(width * height * 3);
  int pixelIndex = 0;

  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      var pixel = image.getPixel(x, y);
      final r = img.getRed(pixel) / 255.0;
      final g = img.getGreen(pixel) / 255.0;
      final b = img.getBlue(pixel) / 255.0;

      convertedBytes[pixelIndex++] = r;
      convertedBytes[pixelIndex++] = g;
      convertedBytes[pixelIndex++] = b;
    }
  }

  return convertedBytes.buffer.asUint8List();
}

Uint8List imageToUint8(img.Image image, int width, int height) {
  var convertedBytes = Uint8List(width * height * 3);
  int pixelIndex = 0;

  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      var pixel = image.getPixel(x, y);
      convertedBytes[pixelIndex++] = img.getRed(pixel);
      convertedBytes[pixelIndex++] = img.getGreen(pixel);
      convertedBytes[pixelIndex++] = img.getBlue(pixel);
    }
  }

  return convertedBytes;
}
