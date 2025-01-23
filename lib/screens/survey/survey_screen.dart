import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/survey_result.dart';
import '../home/home_screen.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  // For predicting symptoms (1~4)
  int qWhiteResidueUnderNail = 1;    // Micro-scaling prediction
  int qOilinessReturnSpeed = 1;      // Excess Sebum prediction
  int qScalpSensitivity = 1;         // Folliculitis prediction
  int qClothingResidue = 1;          // Dandruff prediction
  int qHairFallNotice = 1;           // Hair Loss prediction

  // Lifestyle/management (1~4)
  int qShampooMethod = 2;
  int qFruitVegIntake = 2;
  int qHeadPressure = 2;
  int qScalpProductUse = 2;
  int qDryerCare = 2;
  int qSleepQuality = 2;

  Future<void> _completeSurvey() async {
    SurveyResult result = SurveyResult(
      microScalingLevel: qWhiteResidueUnderNail,
      sebumLevel: qOilinessReturnSpeed,
      folliculitisLevel: qScalpSensitivity,
      dandruffLevel: qClothingResidue,
      hairLossLevel: qHairFallNotice,
      shampooMethod: qShampooMethod,
      fruitVegIntake: qFruitVegIntake,
      headPressure: qHeadPressure,
      scalpProductUse: qScalpProductUse,
      dryerCare: qDryerCare,
      sleepQuality: qSleepQuality,
    );

    final prefs = await SharedPreferences.getInstance();
    // Save survey results
    prefs.setInt('microScalingLevel', result.microScalingLevel);
    prefs.setInt('sebumLevel', result.sebumLevel);
    prefs.setInt('folliculitisLevel', result.folliculitisLevel);
    prefs.setInt('dandruffLevel', result.dandruffLevel);
    prefs.setInt('hairLossLevel', result.hairLossLevel);
    prefs.setInt('shampooMethod', result.shampooMethod);
    prefs.setInt('fruitVegIntake', result.fruitVegIntake);
    prefs.setInt('headPressure', result.headPressure);
    prefs.setInt('scalpProductUse', result.scalpProductUse);
    prefs.setInt('dryerCare', result.dryerCare);
    prefs.setInt('sleepQuality', result.sleepQuality);

    // Navigate to home screen after completion
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  Widget _buildQuestion({
    required String title,
    required String description,
    required int value,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface)),
          SizedBox(height: 8),
          Text(description,
              style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: value.toDouble(),
                  min: 1,
                  max: 4,
                  divisions: 3,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  onChanged: onChanged,
                  label: value.toString(),
                ),
              ),
              Text(
                _valueToLabel(value),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _valueToLabel(int v) {
    switch (v) {
      case 1:
        return 'Rarely';
      case 2:
        return 'Slightly';
      case 3:
        return 'Moderately';
      case 4:
        return 'Severely';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mymo', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Scalp Survey',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onBackground),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'The following questions aim to determine your scalp condition through indirect signs felt in daily life, rather than direct symptoms. '
                    'This information will be visualized in combination with model results.',
                style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),

              // Indirect questions (symptom prediction)
              _buildQuestion(
                title: 'Scalp Scaling Detection',
                description: 'How often do you notice white flakes or scales when you lightly scratch your scalp?',
                value: qWhiteResidueUnderNail,
                onChanged: (val) => setState(() => qWhiteResidueUnderNail = val.toInt()),
              ),
              _buildQuestion(
                title: 'Oiliness Return Speed',
                description: 'How quickly does your scalp lose its freshness after shampooing?',
                value: qOilinessReturnSpeed,
                onChanged: (val) => setState(() => qOilinessReturnSpeed = val.toInt()),
              ),
              _buildQuestion(
                title: 'Scalp Sensitivity',
                description: 'How often does your scalp feel sensitive or painful to touch?',
                value: qScalpSensitivity,
                onChanged: (val) => setState(() => qScalpSensitivity = val.toInt()),
              ),
              _buildQuestion(
                title: 'White Residue on Dark Clothes',
                description: 'How often do you notice white residue on your shoulders when wearing dark clothes?',
                value: qClothingResidue,
                onChanged: (val) => setState(() => qClothingResidue = val.toInt()),
              ),
              _buildQuestion(
                title: 'Hair Loss Perception',
                description: 'How often do you feel that more hair is falling out after combing or shampooing?',
                value: qHairFallNotice,
                onChanged: (val) => setState(() => qHairFallNotice = val.toInt()),
              ),

              // Lifestyle/management
              _buildQuestion(
                title: 'Shampoo Method',
                description: 'How thoroughly do you massage your scalp and rinse it during shampooing?',
                value: qShampooMethod,
                onChanged: (val) => setState(() => qShampooMethod = val.toInt()),
              ),
              _buildQuestion(
                title: 'Fruit/Vegetable Intake',
                description: 'In the past week, how well do you think your intake of fruits/vegetables has contributed to scalp health?',
                value: qFruitVegIntake,
                onChanged: (val) => setState(() => qFruitVegIntake = val.toInt()),
              ),
              _buildQuestion(
                title: 'Head Pressure/Heaviness',
                description: 'How often do you feel heaviness or pressure in your head throughout the day?',
                value: qHeadPressure,
                onChanged: (val) => setState(() => qHeadPressure = val.toInt()),
              ),
              _buildQuestion(
                title: 'Scalp Product Usage',
                description: 'How frequently do you use scalp-specific products like tonics, essences, or scrubs?',
                value: qScalpProductUse,
                onChanged: (val) => setState(() => qScalpProductUse = val.toInt()),
              ),
              _buildQuestion(
                title: 'Hair Dryer Usage',
                description: 'How carefully do you use a hair dryer (e.g., heat adjustment, maintaining distance)?',
                value: qDryerCare,
                onChanged: (val) => setState(() => qDryerCare = val.toInt()),
              ),
              _buildQuestion(
                title: 'Sleep Quality',
                description: 'How well do you feel sufficient and regular sleep contributes to your scalp condition?',
                value: qSleepQuality,
                onChanged: (val) => setState(() => qSleepQuality = val.toInt()),
              ),

              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _completeSurvey,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  minimumSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  elevation: 1,
                ),
                child: Text('Complete Survey'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
