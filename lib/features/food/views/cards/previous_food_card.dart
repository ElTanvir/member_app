import 'package:flutter/material.dart';
import 'package:member_app/features/food/data/data_models/meal_data_model.dart';
import 'package:member_app/utils/constants.dart';

class PreviousFoodCard extends StatelessWidget {
  const PreviousFoodCard({Key? key, required this.mealDataModel})
      : super(key: key);
  final MealDataModel mealDataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10, 20, 10),
      child: Container(
        decoration: KEltDecoration.boxDecoration1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: ${mealDataModel.data}',
                      style: KEltTextStyle.titleText,
                    ),
                    Text(
                      'Day: ${mealDataModel.days}',
                      style: KEltTextStyle.titleText,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Breakfast: ${mealDataModel.breakfast == '1' ? 'Yes' : 'No'}',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Lunch: ${mealDataModel.lunch == '1' ? 'Yes' : 'No'}',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Dinner: ${mealDataModel.dinner == '1' ? 'Yes' : 'No'}',
                      style: KEltTextStyle.subtitleText,
                    )
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
