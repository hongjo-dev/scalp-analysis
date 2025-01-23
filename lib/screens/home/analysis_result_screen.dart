import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../models/analysis_result.dart';
import '../../../models/survey_result.dart';
import '../../../utils/share_image.dart';
import 'product_recommendation_screen.dart';
import 'diet_recommendation_screen.dart';

class AnalysisResultScreen extends StatefulWidget {
  final AnalysisResult result;
  AnalysisResultScreen({required this.result});

  @override
  _AnalysisResultScreenState createState() => _AnalysisResultScreenState();
}

class _AnalysisResultScreenState extends State<AnalysisResultScreen> {
  final GlobalKey _globalKey = GlobalKey();
  SurveyResult? surveyResult;

  Future<void> captureAndShareImage() async {
    // 프레임 렌더링 완료 후 캡처 시도
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 500));
      await shareAnalysisResult(_globalKey);
    });
  }

  int convertSurveyValue(int val) => val - 1;

  Future<void> loadSurveyResult() async {
    final prefs = await SharedPreferences.getInstance();
    surveyResult = SurveyResult(
      microScalingLevel: prefs.getInt('microScalingLevel') ?? 1,
      sebumLevel: prefs.getInt('sebumLevel') ?? 1,
      folliculitisLevel: prefs.getInt('folliculitisLevel') ?? 1,
      dandruffLevel: prefs.getInt('dandruffLevel') ?? 1,
      hairLossLevel: prefs.getInt('hairLossLevel') ?? 1,
      shampooMethod: prefs.getInt('shampooMethod') ?? 2,
      fruitVegIntake: prefs.getInt('fruitVegIntake') ?? 2,
      headPressure: prefs.getInt('headPressure') ?? 2,
      scalpProductUse: prefs.getInt('scalpProductUse') ?? 2,
      dryerCare: prefs.getInt('dryerCare') ?? 2,
      sleepQuality: prefs.getInt('sleepQuality') ?? 2,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadSurveyResult();
  }

  double calculateRatio(int modelVal, int surveyVal) {
    double modelWeight = 0.95;
    double surveyWeight = 0.05;

    double normalizedSurveyVal = surveyVal.toDouble();
    double weightedScore = (modelVal * modelWeight) + (normalizedSurveyVal * surveyWeight);
    double percentage = (weightedScore / 3.0) * 100;
    return percentage.clamp(0.0, 100.0);
  }

  List<Map<String, dynamic>> getConditions() {
    final model = widget.result;
    final sv = surveyResult;
    if (sv == null) return [];

    return [
      {
        'label': 'Folliculitis',
        'ratio': calculateRatio(model.folliculitis, convertSurveyValue(sv.folliculitisLevel)),
      },
      {
        'label': 'Micro-scaling',
        'ratio': calculateRatio(model.fineScaling, convertSurveyValue(sv.microScalingLevel)),
      },
      {
        'label': 'Dandruff',
        'ratio': calculateRatio(model.dandruff, convertSurveyValue(sv.dandruffLevel)),
      },
      {
        'label': 'Hair Loss',
        'ratio': calculateRatio(model.hairLoss, convertSurveyValue(sv.hairLossLevel)),
      },
      {
        'label': 'Excess Sebum',
        'ratio': calculateRatio(model.excessSebum, convertSurveyValue(sv.sebumLevel)),
      },
    ];
  }

  Color getLevelColor(double ratio) {
    if (ratio <= 25) return Colors.green;
    else if (ratio <= 50) return Colors.yellow[800]!;
    else if (ratio <= 75) return Colors.orange;
    else return Colors.red;
  }

  Widget buildConditionChart() {
    final conditions = getConditions();
    if (conditions.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    List<BarChartGroupData> barGroups = [];
    for (int i = 0; i < conditions.length; i++) {
      final c = conditions[i];
      double r = c['ratio'];
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: r.roundToDouble(),
              color: getLevelColor(r),
              width: 18,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Symptom Severity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Severity Scale:\n'
              '• 0–25: Normal\n'
              '• 25–50: Initial\n'
              '• 50–75: Moderate\n'
              '• 75–100: Severe',
          style: TextStyle(fontSize: 13, color: Colors.grey[700]),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              minY: 0,
              groupsSpace: 40,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 25,
                    reservedSize: 40,
                    getTitlesWidget: (value, _) => Text(
                      value.toInt().toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, _) {
                      if (value.toInt() < conditions.length) {
                        final label = conditions[value.toInt()]['label'] as String;
                        final shortLabel = label
                            .replaceAll('Micro-scaling', 'Micro')
                            .replaceAll('Excess Sebum', 'Sebum');
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Transform.rotate(
                            angle: -30 * 3.14159 / 180,
                            child: Text(shortLabel, style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                          ),
                        );
                      }
                      return Text('');
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: barGroups,
              gridData: FlGridData(
                show: true,
                horizontalInterval: 25,
                checkToShowHorizontalLine: (val) => val % 25 == 0,
                getDrawingHorizontalLine: (val) => FlLine(color: Colors.grey[300]!, strokeWidth: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildResultCards() {
    final conditions = getConditions();
    if (conditions.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Column(
      children: conditions.map<Widget>((condition) {
        final ratio = condition['ratio'];
        final label = condition['label'];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 2,
          child: ListTile(
            title: Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: getLevelColor(ratio),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${ratio.toStringAsFixed(0)}%',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildSummarySection() {
    final scalpCondition = widget.result.scalpCondition;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(widget.result.imageFile, height: 180, fit: BoxFit.cover),
        ),
        SizedBox(height: 16),
        Text(
          'Scalp Condition: \n$scalpCondition',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Divider(thickness: 1, color: Colors.grey[300]),
        SizedBox(height: 8),
        Text('Analysis Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(
          'The chart below shows the combined severity ratio of symptoms. '
              'These integrated results, incorporating both model and survey data, provide more precise recommendations.',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
          onPrimary: textColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
          minimumSize: Size.fromHeight(48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scalpCondition = widget.result.scalpCondition;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scalp Analysis Result',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: (surveyResult == null)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 캡처 영역: SummarySection + ResultCards 모두 포함
              RepaintBoundary(
                key: _globalKey,
                child: Container(
                  color: Colors.white, // 명확한 배경색 지정
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildSummarySection(),
                      SizedBox(height: 16),
                      buildResultCards(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              buildConditionChart(),
              SizedBox(height: 30),
              Text(
                'Personalized Recommendations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Check out the recommendations based on your current scalp condition.',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              _buildActionButton(
                text: 'Share Results',
                icon: Icons.share,
                onPressed: captureAndShareImage,
              ),
              _buildActionButton(
                text: 'Get Product Recommendations',
                icon: Icons.shopping_cart_outlined,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductRecommendationScreen(scalpCondition: scalpCondition))),
              ),
              _buildActionButton(
                text: 'Get Diet Recommendations',
                icon: Icons.local_dining,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DietRecommendationScreen(scalpCondition: scalpCondition))),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
