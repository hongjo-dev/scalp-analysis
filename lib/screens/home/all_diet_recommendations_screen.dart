import 'package:flutter/material.dart';
import '../../../data/diet_plan.dart';

class AllDietRecommendationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ScalpTypeDiet> allDiets = ScalpTypeDiet.getScalpTypeDiets();

    return Scaffold(
      appBar: AppBar(
        title: Text('Diet for all scalp conditions'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: allDiets.length,
        itemBuilder: (context, index) {
          ScalpTypeDiet diet = allDiets[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            child: ExpansionTile(
              title: Text(diet.scalpType, style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nutrient Details:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                ),
                for (var detail in diet.nutrientDetails)
                  ListTile(
                    title: Text(detail.name, style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(detail.description),
                  ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${diet.scalpType} diet (example):', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
                ),
                for (var dailyPlan in diet.weeklyDiet)
                  ExpansionTile(
                    title: Text(dailyPlan.day),
                    children: dailyPlan.meals.map((meal) {
                      return ListTile(
                        title: Text(meal.type, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(meal.items.join(', ')),
                      );
                    }).toList(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
