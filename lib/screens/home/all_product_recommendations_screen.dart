import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/product.dart';

class AllProductRecommendationsScreen extends StatelessWidget {
  AllProductRecommendationsScreen({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products for all scalp conditions'),
        centerTitle: true,
      ),
      body: ListView(
        children: productsByScalpCondition.keys.map((scalpType) {
          List<Product> productList = productsByScalpCondition[scalpType] ?? [];
          return Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            child: ExpansionTile(
              title: Text(scalpType, style: TextStyle(fontWeight: FontWeight.bold)),
              children: productList.map((product) {
                return ListTile(
                  title: Text(product.name, style: TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(product.category),
                  onTap: () => _launchUrl(product.link),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
