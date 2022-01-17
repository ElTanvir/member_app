import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/food/logic/food_provider.dart';
import 'package:member_app/features/food/views/cards/meal_menu_card.dart';
import 'package:member_app/features/food/views/cards/previous_food_card.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/loader_v2.dart';
import 'package:member_app/utils/widgets.dart';

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
                        loading: (_) => const LoaderV2(),
                        loaded: (_) {
                          if (_.data.isNotEmpty) {
                            return ListView.builder(
                              itemCount: _.data.length,
                              itemBuilder: (context, index) =>
                                  MealMenuCard(foodMenu: _.data[index]),
                            );
                          } else {
                            return const NoRecordWidget();
                          }
                        },
                        error: (_) => ErrorHandleWidget(error: _.error),
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
                        loading: (_) => const LoaderV2(),
                        loaded: (_) {
                          if (_.data.isNotEmpty) {
                            return ListView.builder(
                              itemCount: _.data.length,
                              itemBuilder: (context, index) => PreviousFoodCard(
                                  mealDataModel: _.data[index]),
                            );
                          } else {
                            return const NoRecordWidget();
                          }
                        },
                        error: (_) => ErrorHandleWidget(error: _.error),
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
