import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/food/data/data_models/food_menu_model.dart';
import 'package:member_app/features/food/data/data_models/meal_data_model.dart';
import 'package:member_app/features/food/data/meal_repo.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/services/network_exceptions.dart';

class FoodHistoryNotifier extends StateNotifier<ApiState<List<MealDataModel>>> {
  final IMealsRepository mealRepository;
  FoodHistoryNotifier(this.mealRepository) : super(const ApiState.initial()) {
    getMealHistory(10);
  }
  Future<void> getMealHistory(int month) async {
    try {
      state = const ApiState.loading();
      final meals = await mealRepository.getMonthlyMeals(month: month);
      state = ApiState.loaded(data: meals);
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}

class FoodMenuNotifier extends StateNotifier<ApiState<List<FoodMenu>>> {
  final IMealsRepository mealRepository;
  FoodMenuNotifier(this.mealRepository) : super(const ApiState.initial()) {
    getMealMenu();
  }
  Future<void> getMealMenu() async {
    try {
      state = const ApiState.loading();
      final meals = await mealRepository.getMealList();
      state = ApiState.loaded(data: meals);
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}
