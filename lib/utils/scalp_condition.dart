import 'package:shared_preferences/shared_preferences.dart';

String combineResults({required Map<String,int> modelResults, required Map<String,int> surveyResults}) {
  // Calculate weighted averages
  double modelWeight = 0.95; // 95% weight for model results
  double surveyWeight = 0.05; // 5% weight for survey results

  // Calculate individual condition scores
  int folliculitis = modelResults['folliculitis'] ?? 0;
  int fineScaling = modelResults['fineScaling'] ?? 0;
  int dandruff = modelResults['dandruff'] ?? 0;
  int hairLoss = modelResults['hairLoss'] ?? 0;
  int excessSebum = modelResults['excessSebum'] ?? 0;

  // Survey scores (normalize to 0-3 scale)
  double surveyFolliculitis = (surveyResults['folliculitisLevel'] ?? 1) - 1;
  double surveyScaling = (surveyResults['microScalingLevel'] ?? 1) - 1;
  double surveyDandruff = (surveyResults['dandruffLevel'] ?? 1) - 1;
  double surveyHairLoss = (surveyResults['hairLossLevel'] ?? 1) - 1;
  double surveySebum = (surveyResults['sebumLevel'] ?? 1) - 1;

  // Calculate weighted scores for each condition
  double folliculitisScore = (folliculitis * modelWeight) + (surveyFolliculitis * surveyWeight);
  double scalingScore = (fineScaling * modelWeight) + (surveyScaling * surveyWeight);
  double dandruffScore = (dandruff * modelWeight) + (surveyDandruff * surveyWeight);
  double hairLossScore = (hairLoss * modelWeight) + (surveyHairLoss * surveyWeight);
  double sebumScore = (excessSebum * modelWeight) + (surveySebum * surveyWeight);

  // Determine conditions using 0.6 threshold (20%)
  bool isSensitive = folliculitisScore > 0.6 || scalingScore > 0.6;
  bool isDandruff = dandruffScore > 0.6;
  bool isHairLoss = hairLossScore > 0.6;
  bool isOily = sebumScore > 0.6;

  // Return condition based on priority
  if (isHairLoss && isSensitive) {
    return "Hair Loss with Sensitive Scalp";
  } else if (isHairLoss && isDandruff) {
    return "Hair Loss with Dandruff";
  } else if (isHairLoss && isOily) {
    return "Hair Loss with Oily Scalp";
  } else if (isHairLoss) {
    return "Hair Loss";
  } else if (isSensitive) {
    return "Sensitive Scalp";
  } else if (isDandruff) {
    return "Dandruff Scalp";
  } else if (isOily) {
    return "Oily Scalp";
  } else if (folliculitisScore > 1.5 || scalingScore > 1.5 || dandruffScore > 1.5 || sebumScore > 1.5) {
    return "Combination Scalp";
  } else {
    return "Healthy Scalp";
  }
}

Future<void> saveFinalScalpCondition(String condition) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('finalScalpCondition', condition);
}
