import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/food/data/data_models/food_menu_model.dart';
import 'package:member_app/features/food/data/data_models/meal_data_model.dart';

import 'package:member_app/features/food/data/meal_repo.dart';
import 'package:member_app/features/food/logic/food_notifier.dart';
import 'package:member_app/services/api_state.dart';

final foodRepositoryProvider =
    Provider<IMealsRepository>((ref) => FakeMealRepository());

final mealHistoryProvider = StateNotifierProvider.autoDispose<
    FoodHistoryNotifier, ApiState<List<MealDataModel>>>((ref) {
  return FoodHistoryNotifier(ref.watch(foodRepositoryProvider));
});
final mealsMenuProvider = StateNotifierProvider.autoDispose<FoodMenuNotifier,
    ApiState<List<FoodMenu>>>((ref) {
  return FoodMenuNotifier(ref.watch(foodRepositoryProvider));
});
