import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/food/data/data_models/food_menu_model.dart';
import 'package:member_app/features/food/data/data_models/meal_data_model.dart';
import 'package:member_app/features/food/logic/food_provider.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/loader_widget.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: KEltDecoration.boxDecoration1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: TabBar(
                unselectedLabelColor: KEltColor.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      KEltColor.primary,
                      KEltColor.primary.withOpacity(0.6)
                    ],
                  ),

                  borderRadius: BorderRadius.circular(10), // Creates border
                ),
                tabs: const [
                  Tab(
                    text: 'Todays Menu',
                  ),
                  Tab(
                    text: 'Previous',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final glass = ref.watch(mealsMenuProvider);
                      return glass.map(
                        initial: (_) => const SizedBox(),
                        loading: (_) => const LoaderWidget(),
                        loaded: (_) => ListView.builder(
                          itemCount: _.data.length,
                          itemBuilder: (context, index) =>
                              MealMenuCard(foodMenu: _.data[index]),
                        ),
                        error: (_) => Text(
                          NetworkExceptions.getErrorMessage(_.error),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final glass = ref.watch(mealHistoryProvider);
                      return glass.map(
                        initial: (_) => const SizedBox(),
                        loading: (_) => const LoaderWidget(),
                        loaded: (_) => ListView.builder(
                          itemCount: _.data.length,
                          itemBuilder: (context, index) =>
                              PreviousFoodCard(mealDataModel: _.data[index]),
                        ),
                        error: (_) => Text(
                          NetworkExceptions.getErrorMessage(_.error),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class MealMenuCard extends StatelessWidget {
  const MealMenuCard({Key? key, required this.foodMenu}) : super(key: key);
  final FoodMenu foodMenu;

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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    '${KEltString.baseImageurl}${foodMenu.food_image}',
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
