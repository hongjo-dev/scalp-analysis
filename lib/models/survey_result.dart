class SurveyResult {
  // 간접질문으로 유추한 증상 (1~4 범위)
  final int microScalingLevel;   // 미세각질 유추
  final int sebumLevel;          // 피지과다 유추
  final int folliculitisLevel;   // 모낭사이홍반 유추
  final int dandruffLevel;       // 비듬 유추
  final int hairLossLevel;       // 탈모 유추

  // 생활습관/관리 (1~4 범위)
  final int shampooMethod;
  final int fruitVegIntake;
  final int headPressure;
  final int scalpProductUse;
  final int dryerCare;
  final int sleepQuality;

  SurveyResult({
    required this.microScalingLevel,
    required this.sebumLevel,
    required this.folliculitisLevel,
    required this.dandruffLevel,
    required this.hairLossLevel,
    required this.shampooMethod,
    required this.fruitVegIntake,
    required this.headPressure,
    required this.scalpProductUse,
    required this.dryerCare,
    required this.sleepQuality,
  });

  Map<String, dynamic> toMap() {
    return {
      'microScalingLevel': microScalingLevel,
      'sebumLevel': sebumLevel,
      'folliculitisLevel': folliculitisLevel,
      'dandruffLevel': dandruffLevel,
      'hairLossLevel': hairLossLevel,
      'shampooMethod': shampooMethod,
      'fruitVegIntake': fruitVegIntake,
      'headPressure': headPressure,
      'scalpProductUse': scalpProductUse,
      'dryerCare': dryerCare,
      'sleepQuality': sleepQuality,
    };
  }

  static SurveyResult fromMap(Map<String, dynamic> map) {
    return SurveyResult(
      microScalingLevel: map['microScalingLevel'],
      sebumLevel: map['sebumLevel'],
      folliculitisLevel: map['folliculitisLevel'],
      dandruffLevel: map['dandruffLevel'],
      hairLossLevel: map['hairLossLevel'],
      shampooMethod: map['shampooMethod'],
      fruitVegIntake: map['fruitVegIntake'],
      headPressure: map['headPressure'],
      scalpProductUse: map['scalpProductUse'],
      dryerCare: map['dryerCare'],
      sleepQuality: map['sleepQuality'],
    );
  }
}
