import 'package:flutter/material.dart';
import '../../../data/diet_plan.dart';

class DietRecommendationScreen extends StatelessWidget {
  final String scalpCondition;

  DietRecommendationScreen({required this.scalpCondition});

  void _showNutrientDetailsDialog(BuildContext context, List<NutrientDetail> nutrientDetails) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nutrient Details', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: nutrientDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nutrientDetails[index].name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        nutrientDetails[index].description,
                        style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('close', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    ScalpTypeDiet dietForScalp = ScalpTypeDiet.getScalpTypeDiets().firstWhere(
          (diet) => diet.scalpType == scalpCondition,
      orElse: () => ScalpTypeDiet(
        scalpType: 'default',
        weeklyDiet: [],
        nutrientDetails: [],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Recommendations', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: dietForScalp.weeklyDiet.length + 1,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          if (index < dietForScalp.weeklyDiet.length) {
            DailyDietPlan dailyPlan = dietForScalp.weeklyDiet[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 1,
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  title: Text(
                    dailyPlan.day,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  children: <Widget>[
                    ...dailyPlan.meals.map((meal) {
                      return ListTile(
                        title: Text(meal.type, style: TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text(
                          meal.items.join(', '),
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                        ),
                      );
                    }).toList(),
                    Divider(height: 1, thickness: 0.5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nutrient Information:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: dailyPlan.dailyNutrients.nutrients.map((nutrient) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              '${nutrient.name}: ${nutrient.amount}',
                              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: ElevatedButton.icon(
                onPressed: () => _showNutrientDetailsDialog(context, dietForScalp.nutrientDetails),
                icon: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.onPrimary),
                label: Text('View Nutrient Details', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                  minimumSize: Size.fromHeight(48),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
