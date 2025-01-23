import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'product_recommendation_screen.dart';
import 'diet_recommendation_screen.dart';

class PreviousAnalysisResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Analysis Results', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final prefs = snapshot.data!;
          final folliculitis = prefs.getInt('folliculitis') ?? 0;
          final fineScaling = prefs.getInt('fineScaling') ?? 0;
          final dandruff = prefs.getInt('dandruff') ?? 0;
          final hairLoss = prefs.getInt('hairLoss') ?? 0;
          final excessSebum = prefs.getInt('excessSebum') ?? 0;
          final scalpCondition = prefs.getString('scalpCondition') ?? 'Unknown';

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Summary of Previous Results',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...buildResultCards([
                    {'condition': 'Folliculitis', 'level': folliculitis},
                    {'condition': 'Fine Scaling', 'level': fineScaling},
                    {'condition': 'Dandruff', 'level': dandruff},
                    {'condition': 'Hair Loss', 'level': hairLoss},
                    {'condition': 'Excess Sebum', 'level': excessSebum},
                  ], context),
                  SizedBox(height: 30),
                  Text(
                    'Scalp Condition: $scalpCondition',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  SizedBox(height: 30),
                  _buildActionButton(
                    context: context,
                    text: 'Get Product Recommendations',
                    icon: Icons.shopping_bag_outlined,
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    textColor: Theme.of(context).colorScheme.onSecondaryContainer,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductRecommendationScreen(scalpCondition: scalpCondition),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  _buildActionButton(
                    context: context,
                    text: 'Get Diet Recommendations',
                    icon: Icons.restaurant_menu,
                    backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                    textColor: Theme.of(context).colorScheme.onTertiaryContainer,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DietRecommendationScreen(scalpCondition: scalpCondition),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> buildResultCards(List<Map<String, dynamic>> results, BuildContext context) {
    return results.map<Widget>((result) {
      return Card(
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 1,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          title: Text(
            result['condition'],
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: getColorForLevel(result['level']),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              getLevelText(result['level']),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  String getLevelText(int level) {
    switch (level) {
      case 0:
        return 'Normal';
      case 1:
        return 'Initial';
      case 2:
        return 'Moderate';
      case 3:
        return 'Severe';
      default:
        return 'Unknown';
    }
  }

  Color getColorForLevel(int level) {
    switch (level) {
      case 0:
        return Colors.green[400]!;
      case 1:
        return Colors.yellow[700]!;
      case 2:
        return Colors.orange[700]!;
      case 3:
        return Colors.red[700]!;
      default:
        return Colors.grey;
    }
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        onPrimary: textColor,
        minimumSize: Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      icon: Icon(icon, color: textColor),
      label: Text(text, style: TextStyle(fontWeight: FontWeight.w600, color: textColor)),
    );
  }
}
