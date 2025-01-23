import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/survey/survey_screen.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final finalScalpCondition = prefs.getString('finalScalpCondition');

  runApp(MyApp(finalScalpCondition: finalScalpCondition));
}

class MyApp extends StatelessWidget {
  final String? finalScalpCondition;

  MyApp({required this.finalScalpCondition});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '머리털 경찰관',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.light,
      ),
      home: finalScalpCondition == null ? SurveyScreen() : HomeScreen(),
    );
  }
}
