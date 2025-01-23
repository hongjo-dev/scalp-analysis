import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/analysis_result.dart';
import '../../utils/audio_player.dart';
import '../../../utils/image_preprocessing.dart';
import '../../../utils/model_inference.dart';
import '../../utils/scalp_condition.dart';
import '../survey/survey_screen.dart';
import 'analysis_result_screen.dart';
import 'previous_analysis_result_screen.dart';
import 'diet_recommendation_screen.dart';
import 'product_recommendation_screen.dart';
import 'all_diet_recommendations_screen.dart';
import 'all_product_recommendations_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  bool hasPreviousResult = false;
  bool isAnalyzing = false;
  String? finalScalpCondition;

  @override
  void initState() {
    super.initState();
    _checkFinalCondition();
  }

  Future<void> _checkFinalCondition() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      hasPreviousResult = prefs.getBool('hasPreviousResult') ?? false;
      finalScalpCondition = prefs.getString('finalScalpCondition');
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image != null ? File(image.path) : null;
    });
  }

  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Photo"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("Select from Gallery"),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a Photo"),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> saveCurrentResultToHistory(AnalysisResult analysisResult) async {
    final prefs = await SharedPreferences.getInstance();
    String? previousJson = prefs.getString('previousResults');
    List<dynamic> previousList = previousJson != null ? jsonDecode(previousJson) : [];

    Map<String, dynamic> currentMap = {
      'imagePath': analysisResult.imageFile.path,
      'folliculitis': analysisResult.folliculitis,
      'fineScaling': analysisResult.fineScaling,
      'dandruff': analysisResult.dandruff,
      'hairLoss': analysisResult.hairLoss,
      'excessSebum': analysisResult.excessSebum,
      'scalpCondition': analysisResult.scalpCondition,
      'timestamp': DateTime.now().toIso8601String(),
    };

    previousList.add(currentMap);
    prefs.setString('previousResults', jsonEncode(previousList));
  }

  Future<void> startNewSurvey() async {
    final prefs = await SharedPreferences.getInstance();
    // Clear all preferences
    await prefs.clear();

    setState(() {
      _image = null;
      hasPreviousResult = false;
      finalScalpCondition = null;
    });

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SurveyScreen()));
  }

  Future<void> _analyzeImage() async {
    if (_image == null) {
      _showNoImageDialog();
      return;
    }
    setState(() {
      isAnalyzing = true;
    });

    final preprocessedImageData = await preprocessImage(_image!.path);
    final results = await executeModels(preprocessedImageData);

    var modelResults = <String,int>{
      'folliculitis': results[0],
      'fineScaling': results[1],
      'dandruff': results[2],
      'hairLoss': results[3],
      'excessSebum': results[4],
    };

    final prefs = await SharedPreferences.getInstance();
    var surveyResults = <String,int>{
      'microScalingLevel': prefs.getInt('microScalingLevel') ?? 1,
      'sebumLevel': prefs.getInt('sebumLevel') ?? 1,
      'folliculitisLevel': prefs.getInt('folliculitisLevel') ?? 1,
      'dandruffLevel': prefs.getInt('dandruffLevel') ?? 1,
      'hairLossLevel': prefs.getInt('hairLossLevel') ?? 1,
    };

    String combinedCondition = combineResults(
      modelResults: modelResults,
      surveyResults: surveyResults,
    );

    await saveFinalScalpCondition(combinedCondition);

    await prefs.setInt('folliculitis', results[0]);
    await prefs.setInt('fineScaling', results[1]);
    await prefs.setInt('dandruff', results[2]);
    await prefs.setInt('hairLoss', results[3]);
    await prefs.setInt('excessSebum', results[4]);
    await prefs.setBool('hasPreviousResult', true);

    setState(() {
      isAnalyzing = false;
      hasPreviousResult = true;
      finalScalpCondition = combinedCondition;
    });

    AnalysisResult analysisResult = AnalysisResult(
      imageFile: _image!,
      folliculitis: results[0],
      fineScaling: results[1],
      dandruff: results[2],
      hairLoss: results[3],
      excessSebum: results[4],
      scalpCondition: combinedCondition,
    );

    // Save current result to history
    await saveCurrentResultToHistory(analysisResult);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnalysisResultScreen(result: analysisResult)),
    );
  }

  void _showNoImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notice"),
          content: Text("Please select an image before analysis."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> saveFinalScalpCondition(String condition) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('finalScalpCondition', condition);
  }

  String combineResults({required Map<String,int> modelResults, required Map<String,int> surveyResults}) {
    double modelWeight = 0.95;
    double surveyWeight = 0.05;

    int folliculitis = modelResults['folliculitis'] ?? 0;
    int fineScaling = modelResults['fineScaling'] ?? 0;
    int dandruff = modelResults['dandruff'] ?? 0;
    int hairLoss = modelResults['hairLoss'] ?? 0;
    int excessSebum = modelResults['excessSebum'] ?? 0;

    double surveyFolliculitis = (surveyResults['folliculitisLevel'] ?? 1) - 1;
    double surveyScaling = (surveyResults['microScalingLevel'] ?? 1) - 1;
    double surveyDandruff = (surveyResults['dandruffLevel'] ?? 1) - 1;
    double surveyHairLoss = (surveyResults['hairLossLevel'] ?? 1) - 1;
    double surveySebum = (surveyResults['sebumLevel'] ?? 1) - 1;

    double folliculitisScore = (folliculitis * modelWeight) + (surveyFolliculitis * surveyWeight);
    double scalingScore = (fineScaling * modelWeight) + (surveyScaling * surveyWeight);
    double dandruffScore = (dandruff * modelWeight) + (surveyDandruff * surveyWeight);
    double hairLossScore = (hairLoss * modelWeight) + (surveyHairLoss * surveyWeight);
    double sebumScore = (excessSebum * modelWeight) + (surveySebum * surveyWeight);

    bool isSensitive = folliculitisScore > 0.6 || scalingScore > 0.6;
    bool isDandruff = dandruffScore > 0.6;
    bool isHairLoss = hairLossScore > 0.6;
    bool isOily = sebumScore > 0.6;

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

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final scalpAnalysisColor = Color(0xFFE6F4F1);
    final dietColor = Color(0xFFE6F4E6);
    final productColor = Color(0xFFF4E6EC);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mymo Care', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          TextButton(
            onPressed: startNewSurvey,
            child: Text("Start New Survey", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => PreviousAnalysisResultScreen()));
            },
            child: Text("View Past Results", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 상단에 프로필 아이콘, Mymo 텍스트, Menu, My Data를 한 줄에 배치
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, color: Colors.white, size: 20),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Mymo",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  _buildMenuChip("Menu"),
                  SizedBox(width: 8),
                  _buildMenuChip("My Data"),
                ],
              ),
              SizedBox(height: 20),
              _buildImageAndStatusUI(screenWidth),
              SizedBox(height: 24),
              _buildFeatureCard(
                color: scalpAnalysisColor,
                title: "Scalp Analysis",
                subtitle: "Analyze your current scalp condition!",
                onTap: () async {
                  if (_image == null) {
                    _showPickOptionsDialog(context);
                  } else {
                    await _analyzeImage();
                  }
                },
                screenWidth: screenWidth,
              ),
              SizedBox(height: 16),
              _buildFeatureCard(
                color: dietColor,
                title: "Diet Recommendation",
                subtitle: "Recommend a suitable diet based on your scalp!",
                onTap: _gotoDietRecommendation,
                screenWidth: screenWidth,
              ),
              SizedBox(height: 16),
              _buildFeatureCard(
                color: productColor,
                title: "Hair Product Recommendation",
                subtitle: "Suggest suitable hair products for your scalp!",
                onTap: _gotoProductRecommendation,
                screenWidth: screenWidth,
              ),
              SizedBox(height: 50),
              // 추가 공간
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => _showPickOptionsDialog(context),
        borderRadius: BorderRadius.circular(50),
        child: Material(
          elevation: 2,
          shape: CircleBorder(),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.camera_alt, color: Colors.black, size: 24),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildImageAndStatusUI(double screenWidth) {
    final borderRadius = BorderRadius.circular(12.0);
    final imageHeight = screenWidth * 0.5;

    return Material(
      elevation: 2,
      borderRadius: borderRadius,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: imageHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: _image != null
                  ? Image.file(_image!, fit: BoxFit.cover)
                  : Image.asset('assets/images/head.png', fit: BoxFit.cover),
            ),
          ),
          if (isAnalyzing)
            Container(
              height: imageHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: borderRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                  SizedBox(height: 20),
                  Text(
                    "LOADING",
                    style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 2),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    final cardWidth = screenWidth * 0.8;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: cardWidth,
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.black87)),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoDietRecommendation() {
    if (finalScalpCondition == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllDietRecommendationsScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DietRecommendationScreen(scalpCondition: finalScalpCondition!)),
      );
    }
  }

  void _gotoProductRecommendation() {
    if (finalScalpCondition == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllProductRecommendationsScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductRecommendationScreen(scalpCondition: finalScalpCondition!)),
      );
    }
  }

  Widget _buildMenuChip(String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}
