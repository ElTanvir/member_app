import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/food/data/data_models/food_menu_model.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/utility_provider.dart';

class MealMenuCard extends ConsumerWidget {
  const MealMenuCard({Key? key, required this.foodMenu}) : super(key: key);
  final FoodMenu foodMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10, 20, 10),
      child: Container(
        decoration: KEltDecoration.boxDecoration1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    '${ref.watch(baseImageUrlProvider)}${foodMenu.food_image}',
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type: ${foodMenu.meal_type}',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Title: ${foodMenu.food_title}',
                      style: KEltTextStyle.subtitleText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
