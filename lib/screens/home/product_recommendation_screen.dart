import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/product.dart'; // Product, productsByScalpCondition가 정의된 곳

class ProductRecommendationScreen extends StatelessWidget {
  final String scalpCondition;

  ProductRecommendationScreen({required this.scalpCondition});

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);

    // launchUrl은 Future<bool>을 반환하며, 성공하면 true, 실패하면 false.
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Could not launch $url');
    }
  }

  Map<String, List<Product>> categorizeProducts(List<Product> products) {
    Map<String, List<Product>> categorized = {};
    for (var product in products) {
      categorized.putIfAbsent(product.category, () => []).add(product);
    }
    return categorized;
  }

  @override
  Widget build(BuildContext context) {
    List<Product>? recommendedProducts = productsByScalpCondition[scalpCondition];
    Map<String, List<Product>> categorizedProducts = categorizeProducts(recommendedProducts ?? []);
    bool isConditionSpecific = scalpCondition == 'Hair Loss with Oily Scalp';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Recommendations',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: (recommendedProducts != null && recommendedProducts.isNotEmpty)
          ? SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isConditionSpecific)
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Rinse and Treatment are not recommended for Hair Loss with Oily Scalp condition.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ...categorizedProducts.keys.map((category) {
              List<Product> products = categorizedProducts[category]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      Product product = products[index];
                      bool isTop1 = index == 0;

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 1,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: isTop1
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.surfaceVariant,
                            child: Icon(
                              isTop1 ? Icons.star : Icons.shopping_cart,
                              color: isTop1
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                          title: Text(
                            product.name,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            product.category,
                            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                          ),
                          onTap: () => _launchUrl(product.link),
                        ),
                      );
                    },
                  ),
                ],
              );
            }).toList(),
            SizedBox(height: 50),
          ],
        ),
      )
          : Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'No product recommendations available.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
