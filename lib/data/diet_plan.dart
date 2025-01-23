import 'package:flutter/material.dart';

class Meal {
  final String type; // '조식', '중식', '석식'
  final List<String> items;

  Meal({required this.type, required this.items});
}

class DailyNutrients {
  final List<Nutrient> nutrients;

  DailyNutrients({required this.nutrients});
}

class Nutrient {
  final String name;
  final String amount;

  Nutrient({required this.name, required this.amount});
}

class DailyDietPlan {
  final String day;
  final List<Meal> meals;
  final DailyNutrients dailyNutrients;

  DailyDietPlan({required this.day, required this.meals, required this.dailyNutrients});
}

class NutrientDetail {
  final String name;
  final String description;

  NutrientDetail({required this.name, required this.description});
}


class ScalpTypeDiet {
  final String scalpType;
  final List<DailyDietPlan> weeklyDiet;
  final List<NutrientDetail> nutrientDetails; // 추가된 속성

  ScalpTypeDiet({
    required this.scalpType,
    required this.weeklyDiet,
    required this.nutrientDetails, // 생성자에 추가
  });

  static List<ScalpTypeDiet> getScalpTypeDiets() {
    return [
      ScalpTypeDiet(
        scalpType: "Sensitive Scalp",
        weeklyDiet: [
          DailyDietPlan(
            day: "Day 1",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Seaweed Soup with Beef and Clams',
                'Stir-fried Vegetables with Chicken',
                'Red Pepper Paste Sauce',
                'Steamed Broccoli'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Spicy Beef Soup',
                'Steamed Skate Fish',
                'Glass Noodles with Pork and Oyster Mushrooms',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice',
                'Tofu Soybean Paste Soup',
                'Grilled Flatfish',
                'Stir-fried Vegetables with Chicken',
                'Stir-fried Sweet Potato Stems',
                'Liquid Yogurt'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B2', amount: '1.6mg'),
              Nutrient(name: 'Vitamin B6', amount: '1.1mg'),
              Nutrient(name: 'Iron', amount: '20.2g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 2",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Beef Soup with Tofu',
                'Braised Quail Eggs',
                'Braised Sweet Potato',
                'Seasoned Enoki Mushrooms',
                'Liquid Yogurt'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Bean Sprout Soup with Beef',
                'Stir-fried Squash',
                'Braised Herring',
                'Red Pepper Paste Sauce',
                'Fresh Seaweed'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Spicy Beef Soup',
                'Rolled Eggs',
                'Stir-fried Anchovies with Nuts',
                'Chive Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B2', amount: '1.6mg'),
              Nutrient(name: 'Vitamin B6', amount: '1.1mg'),
              Nutrient(name: 'Iron', amount: '19.1g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 3",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Black Bean Rice',
                'Mushroom Soybean Paste Soup',
                'Bulgogi (Marinated Pork)',
                'Braised Lotus Root'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Seaweed Soup with Beef and Clams',
                'Stir-fried Burdock Root',
                'Braised Chicken',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Dried Radish Leaves Soup with Beef',
                'Stir-fried Beef with Eggplant',
                'Seasoned Spinach',
                'Plain Yogurt',
                'Tangerine'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B2', amount: '1.5mg'),
              Nutrient(name: 'Vitamin B6', amount: '1.3mg'),
              Nutrient(name: 'Iron', amount: '17.7g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 4",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Curry Rice',
                'Egg Soup',
                'Stir-fried Fish Cake with Vegetables',
                'Cabbage Kimchi',
                'Apple'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Kimchi Stew with Tuna',
                'Braised Tofu',
                'Seasoned Mushrooms',
                'Soy Sauce Seasoning'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice',
                'Mushroom Soybean Paste Soup',
                'Spicy Stir-fried Pork with Vegetables',
                'Seasoned Chives',
                'Radish Kimchi',
                'Sherbet'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B2', amount: '1.3mg'),
              Nutrient(name: 'Vitamin B6', amount: '1.2mg'),
              Nutrient(name: 'Iron', amount: '16.7g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 5",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Three-flavored Salad',
                'Plain Yogurt',
                'Blueberries',
                'Raisins',
                'Smoked Salmon'
              ]),
              Meal(type: 'Lunch', items: [
                'Black Bean Rice',
                'Seaweed Soup with Chicken',
                'Stir-fried Oyster Mushrooms',
                'Braised Beef with Quail Eggs',
                'White Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice',
                'Potato Soybean Paste Soup',
                'Stir-fried Beef with Shiitake Mushrooms',
                'Braised Konjac',
                'Cabbage Kimchi',
                'Black Bean Soy Milk'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B2', amount: '2.1mg'),
              Nutrient(name: 'Vitamin B6', amount: '1.5mg'),
              Nutrient(name: 'Iron', amount: '18.5g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 6",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Dried Radish Leaves Soup with Beef',
                'Mapo Tofu',
                'Seasoned Wild Chive with Soybean Paste',
                'Liquid Yogurt'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Dried Pollack Soup with Tofu and Egg',
                'Spicy Stir-fried Pork with Vegetables',
                'Stir-fried Seaweed Stems',
                'White Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice',
                'Soybean Paste Stew with Pork',
                'Grilled Mackerel',
                'Chive Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B2', amount: '1.3mg'),
              Nutrient(name: 'Vitamin B6', amount: '1.2mg'),
              Nutrient(name: 'Iron', amount: '15.4g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 7",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Bean Sprout Soup with Dried Pollack',
                'Stir-fried Eggs',
                'Fresh Radish Salad'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Squash Soybean Paste Stew with Pork',
                'Stir-fried Fish Cake with Onion',
                'Braised Eggplant',
                'Cucumber Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Small Clam Soup',
                'Grilled Duck',
                'Stir-fried Tuna with Bean Sprouts',
                'Cabbage Kimchi',
                'Vanilla Ice Cream'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B2', amount: '1.5mg'),
              Nutrient(name: 'Vitamin B6', amount: '1.3mg'),
              Nutrient(name: 'Iron', amount: '21.7g'),
            ]),
          ),
        ],
        nutrientDetails: [
          NutrientDetail(
              name: "Vitamin B2 (mg)",
              description: "Promotes growth and prevents worsening of skin redness through developmental regulation"
          ),
          NutrientDetail(
              name: "Vitamin B6 (mg)",
              description: "Plays a key role in energy metabolism and promotes the metabolism of oxygen-carrying substances. Deficiency may increase the risk of skin conditions and lead to scalp redness"
          ),
          NutrientDetail(
              name: "Iron (mg)",
              description: "Transports oxygen throughout the body and activates scalp physiological functions to help recover from redness"
          ),
        ],
      ),
      ScalpTypeDiet(
        scalpType: "Combination Scalp",
        weeklyDiet: [
          DailyDietPlan(
            day: "Day 1",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Green Pea Rice',
                'Tofu Stew',
                'Seasoned Perilla Leaves',
                'Seasoned Eggplant',
                'Radish Water Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Udon with Fried Bean Curd',
                'Cabbage Kimchi',
                'Pickled Radish'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Kimchi Stew with Pork',
                'Rolled Eggs',
                'Mustard Leaf Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '4508.7μg'),
              Nutrient(name: 'Protein', amount: '78.2g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 2",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Chicken Porridge',
                'Stir-fried Perilla Leaves',
                'Seasoned Radish with Perilla Seeds',
                'Seasoned Garlic Stems',
                'Stuffed Cucumber Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Pork Bone Soup',
                'Seasoned Seaweed with Vinegar',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Octopus Hot Pot',
                'Seasoned Eggplant',
                'Fresh Wild Chive Salad',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.5mg'),
              Nutrient(name: 'Beta Carotene', amount: '10680.4μg'),
              Nutrient(name: 'Protein', amount: '97.7g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 3",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Greek Yogurt',
                'Granola with Dried Fruits',
                'Blueberries',
                'Raisins'
              ]),
              Meal(type: 'Lunch', items: [
                'Barley Rice',
                'Spicy Braised Chicken',
                'Seasoned Enoki Mushrooms',
                'Seasoned Radish Salad',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Raw Beef Bibimbap',
                'Seasoned Radish with Perilla Seeds',
                'Seasoned Bean Sprouts',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.1mg'),
              Nutrient(name: 'Beta Carotene', amount: '5412.6μg'),
              Nutrient(name: 'Protein', amount: '79.2g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 4",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Mixed Barley Rice',
                'Pollack Roe Soup',
                'Seasoned Bean Sprouts',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Blue Crab Soup',
                'Stir-fried Potato with Carrots',
                'Seasoned Radish with Perilla Seeds',
                'Green Onion Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Chestnut Rice',
                'Grilled Mackerel',
                'Stir-fried Green Peppers',
                'Braised Quail Eggs',
                'Bean Sprouts with Water Dropwort'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '2184.6μg'),
              Nutrient(name: 'Protein', amount: '80.1g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 5",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Brown Rice Porridge',
                'Braised Beef',
                'Radish Water Kimchi',
                'Soy Milk'
              ]),
              Meal(type: 'Lunch', items: [
                'Omelette Rice',
                'Radish Soybean Paste Soup',
                'Cubed Radish Kimchi',
                'Pickled Radish'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Seaweed Soup with Beef',
                'Glass Noodles with Beef and Mushrooms',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.4mg'),
              Nutrient(name: 'Beta Carotene', amount: '3753.8μg'),
              Nutrient(name: 'Protein', amount: '118.9g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 6",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Oat Rice',
                'Pine Nut Soup with Onion',
                'Stir-fried Carrots',
                'Seasoned Water Dropwort with Fish Cake',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Cold Skate Fish Noodles',
                'Kimchi Dumplings',
                'Pan-fried Eggplant',
                'Cubed Radish Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Spicy Chicken Soup',
                'Stir-fried Potato Strips',
                'Seasoned Red Pepper Leaves',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '2.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '4460.4μg'),
              Nutrient(name: 'Protein', amount: '95g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 7",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Jeonju Bean Sprout Rice Soup',
                'Cabbage Kimchi',
                'Seasoned Squid',
                'Green Chili Pepper'
              ]),
              Meal(type: 'Lunch', items: [
                'Kimbap with Ham',
                'Tofu Soybean Paste Soup',
                'Cabbage Kimchi',
                'Pickled Radish'
              ]),
              Meal(type: 'Dinner', items: [
                'Brown Rice',
                'Steamed Pork Hocks',
                'Wrapped Kimchi',
                'Fresh Lettuce',
                'Seasoned Dried Radish Strips'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '6.8mg'),
              Nutrient(name: 'Beta Carotene', amount: '4111.9μg'),
              Nutrient(name: 'Protein', amount: '115.4g'),
            ]),
          ),
        ],
        nutrientDetails: [
          NutrientDetail(
              name: "Pantothenic Acid (mg)",
              description: "Maintains hair strength and shine"
          ),
          NutrientDetail(
              name: "Beta Carotene (μg)",
              description: "Strengthens scalp and promotes hair growth"
          ),
          NutrientDetail(
              name: "Protein (g)",
              description: "As a key component of hair and scalp, it improves nutrient absorption for healthy hair care"
          ),
        ],
      ),
      ScalpTypeDiet(
        scalpType: "Dandruff Scalp",
        weeklyDiet: [
          DailyDietPlan(
            day: "Day 1",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Egg Rice Bowl',
                'Tuna Salad',
                'Radish Water Kimchi',
                'High-calcium Milk',
                'Banana'
              ]),
              Meal(type: 'Lunch', items: [
                'Black Bean Rice',
                'Stir-fried Sausage with Tomato Sauce and Vegetables',
                'Stir-fried Perilla Leaves with Anchovies',
                'Braised Mackerel in Red Pepper Sauce',
                'Young Radish Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Peanut Rice',
                'Grilled Beef Sirloin',
                'Stir-fried Swiss Chard',
                'Seasoned Seaweed with Vinegar',
                'Pickled Wild Vegetables'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Zinc', amount: '11.8mg'),
              Nutrient(name: 'Omega 3', amount: '6.3g'),
              Nutrient(name: 'Vitamin B', amount: '66.7ug'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 2",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Bagel with Egg',
                'Brown Rice Cereal',
                'Hamburger Steak with Pork and Tomato Sauce',
                'Milk'
              ]),
              Meal(type: 'Lunch', items: [
                'Beef Rice Soup',
                'Mixed Kimchi',
                'Ssamjang (Dipping Sauce)',
                'Onion',
                'Green Chili Pepper'
              ]),
              Meal(type: 'Dinner', items: [
                'Barley Rice',
                'Egg Soup',
                'Grilled Salted Mackerel',
                'Cabbage Kimchi',
                'Marinated Crab'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Zinc', amount: '30.6mg'),
              Nutrient(name: 'Omega 3', amount: '11.2g'),
              Nutrient(name: 'Vitamin B', amount: '108.6ug'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 3",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Mixed Grain Rice with Kidney Beans',
                'Tuna Pancake',
                'Tofu Pancake',
                'Stir-fried Chicken',
                'Roasted Walnuts'
              ]),
              Meal(type: 'Lunch', items: [
                'Stone Pot Rice with Nutrients',
                'Tofu Soup with Clam Meat',
                'Steamed Flounder',
                'Stir-fried Fish Cake with Ham',
                'Radish Water Kimchi',
                'Fresh Radish Salad'
              ]),
              Meal(type: 'Dinner', items: [
                'Millet Rice',
                'Spicy Eel Stew',
                'Glass Noodles with Beef and Wood Ear Mushrooms',
                'Braised Herring',
                'Seasoned Spinach with Soybean Paste'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Zinc', amount: '13.8mg'),
              Nutrient(name: 'Omega 3', amount: '12.4g'),
              Nutrient(name: 'Vitamin B', amount: '28.4ug'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 4",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Steamed Sweet Potato',
                'Roasted Pine Nuts',
                'Boiled Egg',
                'Thousand Island Dressing',
                'Yellow Bell Pepper',
                'Fresh Lettuce'
              ]),
              Meal(type: 'Lunch', items: [
                'Handmade Noodle Soup with Egg and Beef Seasoning',
                'Seasoned Radish with Beef',
                'Bean Sprouts with Crab Meat',
                'Seasoned Small Clams',
                'Young Radish Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Grilled Beef Tenderloin',
                'Pickled Onion',
                'Pickled Cucumber',
                'Spaghetti',
                'Beef Vegetable Soup'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Zinc', amount: '9.6mg'),
              Nutrient(name: 'Omega 3', amount: '1.6g'),
              Nutrient(name: 'Vitamin B', amount: '23.9ug'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 5",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Egg Rice Bowl',
                'Tuna Salad',
                'Radish Water Kimchi',
                'High-calcium Milk',
                'Banana'
              ]),
              Meal(type: 'Lunch', items: [
                'Black Bean Rice',
                'Stir-fried Sausage with Vegetables',
                'Stir-fried Perilla Leaves with Anchovies',
                'Braised Mackerel',
                'Young Radish Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Peanut Rice',
                'Grilled Beef Sirloin',
                'Stir-fried Swiss Chard',
                'Seasoned Seaweed with Vinegar',
                'Pickled Wild Vegetables'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Zinc', amount: '11.8mg'),
              Nutrient(name: 'Omega 3', amount: '6.3g'),
              Nutrient(name: 'Vitamin B', amount: '66.7ug'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 6",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Kimbap with Ham',
                'Steamed Bun with Vegetables',
                'Seasoned Shrimp with Pine Nuts',
                'White Kimchi',
                'Black Bean and Black Sesame Soy Milk',
                'Banana'
              ]),
              Meal(type: 'Lunch', items: [
                'Spicy Young Radish Leaf Bibimbap with Beef',
                'Spinach Soybean Paste Soup',
                'Braised Beef with Quail Eggs',
                'Pickled Wild Vegetables Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Spicy Seafood Stew',
                'Raw Oysters',
                'Fresh Fish Sashimi',
                'Red Pepper Paste Sauce',
                'Soju'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Zinc', amount: '21.9mg'),
              Nutrient(name: 'Omega 3', amount: '1.4g'),
              Nutrient(name: 'Vitamin B', amount: '57.1ug'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 7",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Walnut Porridge',
                'Radish Water Kimchi',
                'Seasoned Octopus',
                'Liquid Yogurt',
                'Banana Chips'
              ]),
              Meal(type: 'Lunch', items: [
                'Kimchi Fried Rice with Pork',
                'Shepherd\'s Purse Soybean Paste Soup',
                'Scrambled Eggs',
                'Stuffed Cucumber Kimchi',
                'Pear Juice'
              ]),
              Meal(type: 'Dinner', items: [
                'Young Radish Leaf Soybean Paste Soup',
                'Raw Octopus',
                'Raw Sea Snail',
                'Pickled Garlic',
                'Red Pepper Paste Sauce',
                'Assorted Sushi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Zinc', amount: '11.0mg'),
              Nutrient(name: 'Omega 3', amount: '3.7g'),
              Nutrient(name: 'Vitamin B', amount: '40.9ug'),
            ]),
          ),
        ],
        nutrientDetails: [
          NutrientDetail(
              name: "Zinc (mg)",
              description: "Strengthens skin's anti-inflammatory and antimicrobial properties while regulating sebum production and promoting skin regeneration"
          ),
          NutrientDetail(
              name: "Omega 3 (g)",
              description: "Maintains skin moisture and elasticity while reducing inflammation and regulating sebum production"
          ),
          NutrientDetail(
              name: "Vitamin B (μg)",
              description: "Promotes skin regeneration and elasticity while preventing scale formation and regulating sebum production"
          ),
        ],
      ),
      ScalpTypeDiet(
        scalpType: "Hair Loss",
        weeklyDiet: [
          DailyDietPlan(
            day: "Day 1",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Potato Soybean Paste Soup',
                'Steamed Eggs',
                'Zucchini Pancake',
                'Braised Beef',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Barley Rice',
                'Bean Sprout Soup with Radish',
                'Stir-fried Kimchi with Pork',
                'Fresh Lettuce Salad',
                'Cabbage Kimchi',
                'Fresh Lettuce'
              ]),
              Meal(type: 'Dinner', items: [
                'Barley Rice with Kidney Beans',
                'Pork Soybean Paste Stew with Pumpkin Leaves',
                'Grilled Flatfish',
                'Stir-fried Fish Cake with Onion',
                'Seasoned Eggplant',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Protein', amount: '90.5g'),
              Nutrient(name: 'Vitamin D', amount: '20.6ug'),
              Nutrient(name: 'Iron', amount: '13.7mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 2",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Black Bean Rice',
                'Dried Pollack Soup with Tofu',
                'Stir-fried Green Seaweed',
                'Braised Eggs with Beef',
                'Romaine Potato Salad',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Soft Tofu Stew',
                'Pan-fried Pollack',
                'Stir-fried Mushrooms with Beef',
                'Seasoned Radish with Perilla Seeds'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice with Kidney Beans',
                'Dried Radish Leaves Soup with Tofu',
                'Grilled Duck',
                'Fresh Lettuce Salad',
                'Cabbage Kimchi',
                'Acorn Jelly'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Protein', amount: '153.3g'),
              Nutrient(name: 'Vitamin D', amount: '26.2ug'),
              Nutrient(name: 'Iron', amount: '2.5mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 3",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Barley Rice with Kidney Beans',
                'Squash Soup with Salted Shrimp',
                'Grilled Hairtail',
                'Stir-fried Seaweed Stems',
                'Braised Konjac',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Brown Rice',
                'Soybean Paste Soup with Tofu',
                'Pan-fried Mackerel',
                'Stir-fried Chicken',
                'Seasoned Wild Chives'
              ]),
              Meal(type: 'Dinner', items: [
                'Barley Rice with Kidney Beans',
                'Seaweed Soup with Beef',
                'Seasoned Crown Daisy',
                'Cabbage Kimchi',
                'Tofu',
                'Steamed Broccoli'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Protein', amount: '106.7g'),
              Nutrient(name: 'Vitamin D', amount: '24.2ug'),
              Nutrient(name: 'Iron', amount: '11.9mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 4",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Soybean Paste Soup with Beef',
                'Stir-fried Dried Shrimp in Red Pepper Sauce',
                'Braised Tofu',
                'Cabbage Kimchi',
                'Sunflower Seeds'
              ]),
              Meal(type: 'Lunch', items: [
                'Black Bean Rice',
                'Squid Soup',
                'Grilled Mackerel',
                'Braised Corn and Baby Potatoes',
                'Cabbage Kimchi',
                'Steamed Broccoli'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice with Kidney Beans',
                'Bean Sprout Soup with Beef',
                'Stir-fried Fish Cake',
                'Seasoned Bean Sprouts',
                'Seasoned Spinach',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Protein', amount: '172.3g'),
              Nutrient(name: 'Vitamin D', amount: '18.1ug'),
              Nutrient(name: 'Iron', amount: '23.8mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 5",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Black Bean Rice',
                'Clear Beef Soup',
                'Stir-fried Dried Fish in Red Pepper Sauce',
                'Stir-fried Cabbage',
                'Cabbage Kimchi',
                'Salted Hairtail'
              ]),
              Meal(type: 'Lunch', items: [
                'Green Pea Rice',
                'Swiss Chard Soybean Paste Soup',
                'Braised Chicken',
                'Fresh Balloon Flower Root Salad',
                'Cabbage Kimchi',
                'Buckwheat Jelly'
              ]),
              Meal(type: 'Dinner', items: [
                'Barley Rice with Kidney Beans',
                'Red Bean Porridge',
                'Seasoned Bracken with Perilla Seeds',
                'Braised Beef',
                'Radish Water Kimchi',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Protein', amount: '120.6g'),
              Nutrient(name: 'Vitamin D', amount: '17.1ug'),
              Nutrient(name: 'Iron', amount: '17.2mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 6",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Bean Rice',
                'Fish Cake Soup',
                'Stir-fried Pork with Bean Sprouts',
                'Braised Burdock Root',
                'Seasoned Spinach',
                'Radish Kimchi',
                'Soy Sauce Seasoning'
              ]),
              Meal(type: 'Lunch', items: [
                'Dried Green Laver',
                'Bean Sprout Rice',
                'Fermented Soybean Stew with Beef',
                'Steamed Eggs',
                'Cabbage Kimchi',
                'Fresh Radish Salad'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice with Kidney Beans',
                'Chicken Soup with Radish',
                'Seasoned Bracken',
                'Braised Tofu',
                'Cabbage Kimchi',
                'Pickled Cucumber'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Protein', amount: '153.3g'),
              Nutrient(name: 'Vitamin D', amount: '20.5ug'),
              Nutrient(name: 'Iron', amount: '15.4mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 7",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Black Bean Rice',
                'Soft Tofu Stew',
                'Braised Beef',
                'Seasoned Spinach',
                'Cabbage Kimchi',
                'Pickled Perilla Leaves'
              ]),
              Meal(type: 'Lunch', items: [
                'Green Pea Rice',
                'Shepherd\'s Purse Soybean Paste Soup',
                'Grilled Yellow Croaker',
                'Stir-fried Mushrooms with Beef',
                'Cabbage Kimchi',
                'Cabbage Salad'
              ]),
              Meal(type: 'Dinner', items: [
                'Bean Rice',
                'Cod Soup',
                'Stir-fried Anchovies',
                'Bulgogi (Marinated Beef)',
                'Seasoned Bean Sprouts',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Protein', amount: '150.6g'),
              Nutrient(name: 'Vitamin D', amount: '21.3ug'),
              Nutrient(name: 'Iron', amount: '26.5mg'),
            ]),
          ),
        ],
        nutrientDetails: [
          NutrientDetail(
              name: "Protein (g)",
              description: "Primary component for hair growth and structure"
          ),
          NutrientDetail(
              name: "Vitamin D (μg)",
              description: "Promotes follicle growth and prevents scalp inflammation"
          ),
          NutrientDetail(
              name: "Iron (mg)",
              description: "Improves blood supply to hair and supports growth"
          ),
        ],
      ),
      ScalpTypeDiet(
        scalpType: "Oily Scalp",
        weeklyDiet: [
          DailyDietPlan(
            day: "Day 1",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Green Pea Rice',
                'Tofu Stew',
                'Seasoned Perilla Leaves',
                'Seasoned Eggplant',
                'Radish Water Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Fried Bean Curd Noodle Soup',
                'Cabbage Kimchi',
                'Pickled Radish'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Kimchi Stew with Pork',
                'Rolled Eggs',
                'Mustard Leaf Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '4508.7μg'),
              Nutrient(name: 'Protein', amount: '78.2g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 2",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Chicken Porridge',
                'Stir-fried Perilla Leaves',
                'Seasoned Radish with Perilla Seeds',
                'Seasoned Garlic Stems',
                'Stuffed Cucumber Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Pork Bone Soup',
                'Seasoned Seaweed with Vinegar',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Octopus Hot Pot',
                'Seasoned Eggplant',
                'Fresh Wild Chive Salad',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.5mg'),
              Nutrient(name: 'Beta Carotene', amount: '10680.4μg'),
              Nutrient(name: 'Protein', amount: '97.7g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 3",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Greek Yogurt',
                'Granola with Dried Fruits',
                'Blueberries',
                'Raisins'
              ]),
              Meal(type: 'Lunch', items: [
                'Barley Rice',
                'Spicy Braised Chicken',
                'Seasoned Radish Salad',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Raw Beef Bibimbap',
                'Seasoned Radish with Perilla Seeds',
                'Bean Sprouts',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.1mg'),
              Nutrient(name: 'Beta Carotene', amount: '5412.6μg'),
              Nutrient(name: 'Protein', amount: '79.2g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 4",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Mixed Barley Rice',
                'Pollack Roe Soup',
                'Bean Sprouts',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Blue Crab Soup',
                'Stir-fried Potato with Carrots',
                'Seasoned Radish with Perilla Seeds',
                'Green Onion Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Chestnut Rice',
                'Grilled Mackerel',
                'Stir-fried Green Peppers',
                'Braised Quail Eggs',
                'Bean Sprouts with Water Dropwort'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '2184.6μg'),
              Nutrient(name: 'Protein', amount: '80.2g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 5",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Brown Rice Porridge',
                'Braised Beef',
                'Radish Water Kimchi',
                'Soy Milk'
              ]),
              Meal(type: 'Lunch', items: [
                'Omelette Rice',
                'Radish Soybean Paste Soup',
                'Cubed Radish Kimchi',
                'Pickled Radish'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Seaweed Soup with Beef',
                'Glass Noodles with Beef and Mushrooms',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.4mg'),
              Nutrient(name: 'Beta Carotene', amount: '3753.8μg'),
              Nutrient(name: 'Protein', amount: '118.9g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 6",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Oat Rice',
                'Pine Nut Soup with Onion',
                'Stir-fried Carrots',
                'Seasoned Water Dropwort with Fish Cake',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Cold Skate Fish Noodles',
                'Kimchi Dumplings',
                'Pan-fried Eggplant',
                'Cubed Radish Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Spicy Chicken Soup',
                'Stir-fried Shredded Potato',
                'Seasoned Red Pepper Leaves',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '2.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '4460.4μg'),
              Nutrient(name: 'Protein', amount: '95g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 7",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Jeonju Bean Sprout Rice Soup',
                'Cabbage Kimchi',
                'Seasoned Squid',
                'Green Chili Pepper'
              ]),
              Meal(type: 'Lunch', items: [
                'Kimbap with Ham',
                'Tofu Soybean Paste Soup',
                'Cabbage Kimchi',
                'Pickled Radish'
              ]),
              Meal(type: 'Dinner', items: [
                'Brown Rice',
                'Steamed Pork Hocks',
                'Wrapped Kimchi',
                'Fresh Lettuce',
                'Seasoned Dried Radish Strips'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '6.8mg'),
              Nutrient(name: 'Beta Carotene', amount: '4111.9μg'),
              Nutrient(name: 'Protein', amount: '115.4g'),
            ]),
          ),
        ],
        nutrientDetails: [
          NutrientDetail(
              name: "Pantothenic Acid (mg)",
              description: "Maintains hair strength and shine"
          ),
          NutrientDetail(
              name: "Beta Carotene (μg)",
              description: "Strengthens scalp and promotes hair growth"
          ),
          NutrientDetail(
              name: "Protein (g)",
              description: "As a key component of hair and scalp, it improves nutrient absorption for healthy hair care"
          ),
        ],
      ),
      ScalpTypeDiet(
        scalpType: "Hair Loss with Dandruff",
        weeklyDiet: [
          DailyDietPlan(
            day: "Day 1",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Potato Soybean Paste Soup',
                'Steamed Eggs',
                'Zucchini Pancake',
                'Braised Beef',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Barley Rice',
                'Bean Sprout Soup with Radish',
                'Stir-fried Kimchi with Pork',
                'Fresh Lettuce Salad',
                'Cabbage Kimchi',
                'Fresh Lettuce'
              ]),
              Meal(type: 'Dinner', items: [
                'Peanut Rice',
                'Grilled Beef Sirloin',
                'Stir-fried Swiss Chard',
                'Seasoned Seaweed with Vinegar',
                'Pickled Wild Vegetables'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B', amount: '66.7μg'),
              Nutrient(name: 'Vitamin D', amount: '0.6μg'),
              Nutrient(name: 'Zinc', amount: '11.8mg'),
              Nutrient(name: 'Iron', amount: '13.7mg'),
              Nutrient(name: 'Protein', amount: '90.5g'),
              Nutrient(name: 'Omega 3', amount: '6.3g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 2",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Black Bean Rice',
                'Dried Pollack Soup with Tofu',
                'Stir-fried Sea Ear Mushrooms',
                'Braised Eggs with Beef',
                'Romaine Potato Salad',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Soft Tofu Stew',
                'Pan-fried Pollack',
                'Stir-fried Mushrooms with Beef',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Barley Rice',
                'Egg Soup',
                'Grilled Salted Mackerel',
                'Cabbage Kimchi',
                'Marinated Crab'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B', amount: '108.6μg'),
              Nutrient(name: 'Vitamin D', amount: '26.2μg'),
              Nutrient(name: 'Zinc', amount: '30.6mg'),
              Nutrient(name: 'Iron', amount: '2.5mg'),
              Nutrient(name: 'Protein', amount: '153.3g'),
              Nutrient(name: 'Omega 3', amount: '11.2g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 3",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Bagel with Egg',
                'Brown Rice Cereal',
                'Hamburger Steak with Pork and Tomato Sauce',
                'Milk'
              ]),
              Meal(type: 'Lunch', items: [
                'Brown Rice',
                'Soybean Paste Soup with Tofu',
                'Pan-fried Mackerel',
                'Stir-fried Chicken',
                'Seasoned Wild Chives'
              ]),
              Meal(type: 'Dinner', items: [
                'Barley Rice with Kidney Beans',
                'Seaweed Soup with Beef',
                'Seasoned Crown Daisy',
                'Cabbage Kimchi',
                'Tofu',
                'Steamed Broccoli'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B', amount: '108.6μg'),
              Nutrient(name: 'Vitamin D', amount: '4.2μg'),
              Nutrient(name: 'Zinc', amount: '30.6mg'),
              Nutrient(name: 'Iron', amount: '11.9mg'),
              Nutrient(name: 'Protein', amount: '106.7g'),
              Nutrient(name: 'Omega 3', amount: '11.2g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 4",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Simple Soybean Paste Soup with Beef',
                'Stir-fried Dried Shrimp in Red Pepper Sauce',
                'Braised Tofu',
                'Cabbage Kimchi',
                'Dried Sunflower Seeds'
              ]),
              Meal(type: 'Lunch', items: [
                'Korean Hand-pulled Dough Soup',
                'Seasoned Radish with Beef',
                'Bean Sprouts with Crab Meat',
                'Seasoned Small Clams',
                'Young Radish Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice with Kidney Beans',
                'Bean Sprout Soup with Beef',
                'Stir-fried Fish Cake',
                'Seasoned Bean Sprouts',
                'Seasoned Spinach',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B', amount: '23.9μg'),
              Nutrient(name: 'Vitamin D', amount: '8.1μg'),
              Nutrient(name: 'Zinc', amount: '9.6mg'),
              Nutrient(name: 'Iron', amount: '23.8mg'),
              Nutrient(name: 'Protein', amount: '172.3g'),
              Nutrient(name: 'Omega 3', amount: '1.6g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 5",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Milk',
                'Ricotta Cheese',
                'Canned Corn',
                'Coleslaw',
                'Chicken Sandwich'
              ]),
              Meal(type: 'Lunch', items: [
                'Black Bean Rice',
                'Kimchi Stew with Pork',
                'Grilled Pacific Saury',
                'Pan-fried Tofu',
                'Radish Water Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Barley Rice with Kidney Beans',
                'Red Bean Porridge',
                'Seasoned Bracken with Perilla Seeds',
                'Braised Beef',
                'Radish Water Kimchi',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B', amount: '23.6μg'),
              Nutrient(name: 'Vitamin D', amount: '7.1μg'),
              Nutrient(name: 'Zinc', amount: '11.2mg'),
              Nutrient(name: 'Iron', amount: '17.2mg'),
              Nutrient(name: 'Protein', amount: '120.6g'),
              Nutrient(name: 'Omega 3', amount: '7.7g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 6",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Bean Rice',
                'Fish Cake Soup',
                'Stir-fried Pork with Bean Sprouts',
                'Braised Burdock Root',
                'Seasoned Spinach',
                'Cubed Radish Kimchi',
                'Soy Sauce Seasoning'
              ]),
              Meal(type: 'Lunch', items: [
                'Young Radish Leaf Bibimbap with Beef',
                'Spinach Soybean Paste Soup',
                'Braised Beef with Quail Eggs',
                'Pickled Wild Vegetables Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Spicy Seafood Stew',
                'Raw Oysters',
                'Fresh Fish Sashimi',
                'Red Pepper Paste Sauce',
                'Soju'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B', amount: '57.1μg'),
              Nutrient(name: 'Vitamin D', amount: '0.5μg'),
              Nutrient(name: 'Zinc', amount: '21.9mg'),
              Nutrient(name: 'Iron', amount: '15.4mg'),
              Nutrient(name: 'Protein', amount: '153.3g'),
              Nutrient(name: 'Omega 3', amount: '1.4g'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 7",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Walnut Porridge',
                'Radish Water Kimchi',
                'Seasoned Octopus',
                'Liquid Yogurt',
                'Banana Chips'
              ]),
              Meal(type: 'Lunch', items: [
                'Green Pea Rice',
                'Shepherd\'s Purse Soybean Paste Soup',
                'Grilled Yellow Croaker',
                'Stir-fried Mushrooms with Beef',
                'Cabbage Kimchi',
                'Coleslaw'
              ]),
              Meal(type: 'Dinner', items: [
                'Bean Rice',
                'Cod Soup',
                'Stir-fried Anchovies',
                'Bulgogi (Marinated Beef)',
                'Seasoned Bean Sprouts',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Vitamin B', amount: '40.9μg'),
              Nutrient(name: 'Vitamin D', amount: '1.3μg'),
              Nutrient(name: 'Zinc', amount: '11.0mg'),
              Nutrient(name: 'Iron', amount: '26.5mg'),
              Nutrient(name: 'Protein', amount: '150.6g'),
              Nutrient(name: 'Omega 3', amount: '3.7g'),
            ]),
          ),
        ],
        nutrientDetails: [
          NutrientDetail(
              name: "Vitamin B (μg)",
              description: "Promotes skin regeneration and elasticity while preventing scale formation and regulating sebum production"
          ),
          NutrientDetail(
              name: "Vitamin D (μg)",
              description: "Promotes follicle growth and prevents scalp inflammation"
          ),
          NutrientDetail(
              name: "Zinc (mg)",
              description: "Strengthens skin's anti-inflammatory and antimicrobial properties while regulating sebum production and promoting skin regeneration"
          ),
          NutrientDetail(
              name: "Iron (mg)",
              description: "Improves blood supply to hair and supports growth"
          ),
          NutrientDetail(
              name: "Protein (g)",
              description: "Primary component for hair growth and structure"
          ),
          NutrientDetail(
              name: "Omega 3 (g)",
              description: "Maintains skin moisture and elasticity while reducing inflammation and regulating sebum production"
          ),
        ],
      ),
      ScalpTypeDiet(
        scalpType: "Hair Loss with Oily Scalp",
        weeklyDiet: [
          DailyDietPlan(
            day: "Day 1",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Potato Soybean Paste Soup',
                'Steamed Eggs',
                'Zucchini Pancake',
                'Braised Beef',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Fried Bean Curd Noodle Soup',
                'Cabbage Kimchi',
                'Pickled Radish'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Kimchi Stew with Pork',
                'Rolled Eggs',
                'Mustard Leaf Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '4508.7μg'),
              Nutrient(name: 'Protein', amount: '78.2g'),
              Nutrient(name: 'Vitamin D', amount: '0.6μg'),
              Nutrient(name: 'Iron', amount: '13.7mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 2",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Chicken Porridge',
                'Stir-fried Perilla Leaves',
                'Seasoned Radish with Perilla Seeds',
                'Seasoned Garlic Stems',
                'Stuffed Cucumber Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Soft Tofu Stew',
                'Pan-fried Pollack',
                'Stir-fried Mushrooms with Beef',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Spicy Octopus Hot Pot',
                'Seasoned Eggplant',
                'Fresh Wild Chive Salad',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.5mg'),
              Nutrient(name: 'Beta Carotene', amount: '10680.4μg'),
              Nutrient(name: 'Protein', amount: '97.7g'),
              Nutrient(name: 'Vitamin D', amount: '26.2μg'),
              Nutrient(name: 'Iron', amount: '2.5mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 3",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Barley Rice with Kidney Beans',
                'Squash Soup with Salted Shrimp',
                'Grilled Hairtail',
                'Stir-fried Seaweed Stems',
                'Braised Konjac',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Barley Rice',
                'Spicy Braised Chicken',
                'Seasoned Mushrooms',
                'Seasoned Radish Salad',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Raw Beef Bibimbap',
                'Seasoned Radish with Perilla Seeds',
                'Bean Sprouts',
                'White Kimchi',
                'Soft Tofu'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.1mg'),
              Nutrient(name: 'Beta Carotene', amount: '5412.6μg'),
              Nutrient(name: 'Protein', amount: '79.2g'),
              Nutrient(name: 'Vitamin D', amount: '4.2μg'),
              Nutrient(name: 'Iron', amount: '11.9mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 4",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Young Radish Leaves Soybean Paste Soup with Beef',
                'Stir-fried Dried Shrimp with Red Pepper Paste',
                'Braised Tofu',
                'Cabbage Kimchi',
                'Dried Sunflower Seeds'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Blue Crab Soup',
                'Stir-fried Potato with Carrots',
                'Seasoned Radish with Perilla Seeds',
                'Green Onion Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice with Kidney Beans',
                'Bean Sprout Soup with Beef',
                'Stir-fried Fish Cake',
                'Bean Sprouts',
                'Seasoned Spinach',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '2184.6μg'),
              Nutrient(name: 'Protein', amount: '80.1g'),
              Nutrient(name: 'Vitamin D', amount: '8.1μg'),
              Nutrient(name: 'Iron', amount: '23.8mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 5",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Brown Rice Porridge',
                'Braised Beef',
                'Radish Water Kimchi',
                'Soy Milk'
              ]),
              Meal(type: 'Lunch', items: [
                'Green Pea Rice',
                'Swiss Chard Soybean Paste Soup',
                'Braised Chicken',
                'Fresh Balloon Flower Root Salad',
                'Cabbage Kimchi',
                'Buckwheat Jelly'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Seaweed Soup with Beef',
                'Glass Noodles with Beef and Mushrooms',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.4mg'),
              Nutrient(name: 'Beta Carotene', amount: '3753.8μg'),
              Nutrient(name: 'Protein', amount: '118.9g'),
              Nutrient(name: 'Vitamin D', amount: '26.2μg'),
              Nutrient(name: 'Iron', amount: '2.5mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 6",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Oat Rice',
                'Pine Nut Soup with Onion',
                'Stir-fried Carrots',
                'Seasoned Water Dropwort with Fish Cake',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Cold Skate Fish Noodles',
                'Kimchi Dumplings',
                'Pan-fried Eggplant',
                'Cubed Radish Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Spicy Chicken Soup',
                'Seasoned Bracken with Perilla Seeds',
                'Braised Beef',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '2.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '4460.4μg'),
              Nutrient(name: 'Protein', amount: '95g'),
              Nutrient(name: 'Vitamin D', amount: '7.1μg'),
              Nutrient(name: 'Iron', amount: '17.2mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 7",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Jeonju Bean Sprout Rice Soup',
                'Cabbage Kimchi',
                'Seasoned Squid',
                'Green Chili Pepper'
              ]),
              Meal(type: 'Lunch', items: [
                'Green Pea Rice',
                'Shepherd\'s Purse Soybean Paste Soup',
                'Grilled Yellow Croaker',
                'Stir-fried Mushrooms with Beef',
                'Cabbage Kimchi',
                'Coleslaw'
              ]),
              Meal(type: 'Dinner', items: [
                'Bean Rice',
                'Cod Soup',
                'Stir-fried Anchovies',
                'Bulgogi (Marinated Beef)',
                'Seasoned Bean Sprouts',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '6.8mg'),
              Nutrient(name: 'Beta Carotene', amount: '4111.9μg'),
              Nutrient(name: 'Protein', amount: '115.4g'),
              Nutrient(name: 'Vitamin D', amount: '1.3μg'),
              Nutrient(name: 'Iron', amount: '26.5mg'),
            ]),
          ),
        ],
        nutrientDetails: [
          NutrientDetail(
              name: "Pantothenic Acid (mg)",
              description: "Maintains hair strength and shine"
          ),
          NutrientDetail(
              name: "Beta Carotene (μg)",
              description: "Strengthens scalp and promotes hair growth"
          ),
          NutrientDetail(
              name: "Protein (g)",
              description: "Primary component for hair growth and structure"
          ),
          NutrientDetail(
              name: "Vitamin D (μg)",
              description: "Promotes follicle growth and prevents scalp inflammation"
          ),
          NutrientDetail(
              name: "Iron (mg)",
              description: "Improves blood supply to hair and supports growth"
          ),
        ],
      ),
      ScalpTypeDiet(
        scalpType: "Hair Loss with Sensitive Scalp",
        weeklyDiet: [
          DailyDietPlan(
            day: "Day 1",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Black Rice',
                'Dried Pollack Soup with Tofu',
                'Stir-fried Green Algae and Shellfish',
                'Braised Beef and Egg',
                'Romaine Potato Salad',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Soft Tofu Stew',
                'Pan-fried Pollack',
                'Stir-fried Mushrooms with Beef',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Soybean Paste Soup with Dried Radish Leaves',
                'Stir-fried Beef with Eggplant',
                'Seasoned Spinach',
                'Plain Yogurt',
                'Mandarin Orange'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.2mg'),
              Nutrient(name: 'Beta Carotene', amount: '5000.2μg'),
              Nutrient(name: 'Protein', amount: '95.3g'),
              Nutrient(name: 'Vitamin D', amount: '7.1μg'),
              Nutrient(name: 'Iron', amount: '15.4mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 2",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Rice with Barley',
                'Seaweed Soup with Clams',
                'Stir-fried Vegetables with Chicken',
                'Soy Sauce',
                'Steamed Broccoli'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Kimchi Stew',
                'Steamed Skate Fish',
                'Glass Noodles with Pork',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Rice with Kidney Beans',
                'Pork Soybean Paste Soup with Pumpkin Leaves',
                'Grilled Flounder',
                'Stir-fried Fish Cake',
                'Seasoned Eggplant',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '3.8mg'),
              Nutrient(name: 'Beta Carotene', amount: '8000.7μg'),
              Nutrient(name: 'Protein', amount: '90.5g'),
              Nutrient(name: 'Vitamin D', amount: '0.8μg'),
              Nutrient(name: 'Iron', amount: '20.2mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 3",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Curry Rice',
                'Egg Soup',
                'Stir-fried Vegetables with Fish Cake',
                'Cabbage Kimchi',
                'Apple'
              ]),
              Meal(type: 'Lunch', items: [
                'Mixed Grain Rice',
                'Soybean Paste Soup with Mushrooms',
                'Spicy Stir-fried Pork',
                'Seasoned Chives',
                'Radish Kimchi',
                'Sherbet'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Squid Soup',
                'Grilled Mackerel',
                'Steamed Corn and Potatoes',
                'Cabbage Kimchi',
                'Steamed Broccoli'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.1mg'),
              Nutrient(name: 'Beta Carotene', amount: '5412.6μg'),
              Nutrient(name: 'Protein', amount: '97.7g'),
              Nutrient(name: 'Vitamin D', amount: '4.2μg'),
              Nutrient(name: 'Iron', amount: '11.9mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 4",
            meals: [
              Meal(type: 'Breakfast', items: [
                'White Rice',
                'Soybean Paste Soup with Beef',
                'Stir-fried Dried Shrimp with Red Pepper Paste',
                'Braised Tofu',
                'Cabbage Kimchi',
                'Salted Pollack Roe'
              ]),
              Meal(type: 'Lunch', items: [
                'White Rice',
                'Blue Crab Soup',
                'Stir-fried Potato with Carrots',
                'Seasoned Radish with Perilla Seeds',
                'Green Onion Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'Mixed Grain Rice',
                'Bean Sprout Soup with Beef',
                'Stir-fried Fish Cake',
                'Bean Sprouts',
                'Seasoned Spinach',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '2184.6μg'),
              Nutrient(name: 'Protein', amount: '80.1g'),
              Nutrient(name: 'Vitamin D', amount: '8.1μg'),
              Nutrient(name: 'Iron', amount: '23.8mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 5",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Brown Rice Porridge',
                'Braised Beef',
                'Radish Water Kimchi',
                'Soy Milk'
              ]),
              Meal(type: 'Lunch', items: [
                'Green Pea Rice',
                'Swiss Chard Soybean Paste Soup',
                'Braised Chicken',
                'Fresh Balloon Flower Root Salad',
                'Cabbage Kimchi',
                'Buckwheat Jelly'
              ]),
              Meal(type: 'Dinner', items: [
                'Black Bean Rice',
                'Seaweed Soup with Beef',
                'Glass Noodles with Beef and Mushrooms',
                'Seasoned Radish with Perilla Seeds',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '4.4mg'),
              Nutrient(name: 'Beta Carotene', amount: '3753.8μg'),
              Nutrient(name: 'Protein', amount: '118.9g'),
              Nutrient(name: 'Vitamin D', amount: '26.2μg'),
              Nutrient(name: 'Iron', amount: '2.5mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 6",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Oat Rice',
                'Pine Nut Soup with Onion',
                'Stir-fried Carrots',
                'Seasoned Water Dropwort with Fish Cake',
                'Cabbage Kimchi'
              ]),
              Meal(type: 'Lunch', items: [
                'Cold Skate Fish Noodles',
                'Kimchi Dumplings',
                'Pan-fried Eggplant',
                'Cubed Radish Kimchi'
              ]),
              Meal(type: 'Dinner', items: [
                'White Rice',
                'Spicy Chicken Soup',
                'Seasoned Bracken with Perilla Seeds',
                'Braised Beef',
                'White Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '2.7mg'),
              Nutrient(name: 'Beta Carotene', amount: '4460.4μg'),
              Nutrient(name: 'Protein', amount: '95g'),
              Nutrient(name: 'Vitamin D', amount: '7.1μg'),
              Nutrient(name: 'Iron', amount: '17.2mg'),
            ]),
          ),
          DailyDietPlan(
            day: "Day 7",
            meals: [
              Meal(type: 'Breakfast', items: [
                'Jeonju Bean Sprout Rice Soup',
                'Cabbage Kimchi',
                'Seasoned Squid',
                'Green Chili Pepper'
              ]),
              Meal(type: 'Lunch', items: [
                'Green Pea Rice',
                'Shepherd\'s Purse Soybean Paste Soup',
                'Grilled Yellow Croaker',
                'Stir-fried Mushrooms with Beef',
                'Cabbage Kimchi',
                'Coleslaw'
              ]),
              Meal(type: 'Dinner', items: [
                'Bean Rice',
                'Cod Soup',
                'Stir-fried Anchovies',
                'Bulgogi (Marinated Beef)',
                'Seasoned Bean Sprouts',
                'Cabbage Kimchi'
              ]),
            ],
            dailyNutrients: DailyNutrients(nutrients: [
              Nutrient(name: 'Pantothenic Acid', amount: '6.8mg'),
              Nutrient(name: 'Beta Carotene', amount: '4111.9μg'),
              Nutrient(name: 'Protein', amount: '115.4g'),
              Nutrient(name: 'Vitamin D', amount: '1.3μg'),
              Nutrient(name: 'Iron', amount: '26.5mg'),
            ]),
          ),
        ],
        nutrientDetails: [
          NutrientDetail(
              name: "Pantothenic Acid (mg)",
              description: "Helps maintain scalp health and reduces sensitivity."
          ),
          NutrientDetail(
              name: "Beta Carotene (μg)",
              description: "Strengthens the scalp and promotes hair growth."
          ),
          NutrientDetail(
              name: "Protein (g)",
              description: "Essential for hair growth and structure."
          ),
          NutrientDetail(
              name: "Vitamin D (μg)",
              description: "Promotes follicle growth and prevents inflammation."
          ),
          NutrientDetail(
              name: "Iron (mg)",
              description: "Improves blood circulation and supports hair health."
          ),
        ],
      ),
    ];
  }
}
