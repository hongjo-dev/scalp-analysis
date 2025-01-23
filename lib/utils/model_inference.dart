import 'dart:typed_data';

import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:math' as math;
import 'dart:async';

Future<List<dynamic>> executeModels(Uint8List imageData) async {
  List<dynamic> results = [];

  for (int i = 1; i <= 5; i++) {
    Interpreter? interpreter;
    try {
      interpreter = await Interpreter.fromAsset('assets/model/tensor_model$i.tflite');
      interpreter.allocateTensors();

      var output = List.filled(4, 0.0).reshape([1, 4]);
      interpreter.run(imageData, output);

      final predictedClass = output[0].indexOf(output[0].reduce((a, b) => math.max<double>(a, b)));
      print("Model $i Predicted Class Index: $predictedClass");
      results.add(predictedClass);
    } catch (e) {
      print("Error loading or executing model $i: $e");
    } finally {
      interpreter?.close();
      interpreter = null;
    }

    // 가비지 컬렉션 유도 (필요 시)
    await Future.delayed(const Duration(seconds: 10));
  }

  return results;
}
