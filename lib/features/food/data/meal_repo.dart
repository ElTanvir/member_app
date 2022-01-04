import 'dart:convert';
import 'package:member_app/features/food/data/data_models/food_menu_model.dart';
import 'package:member_app/features/food/data/data_models/meal_data_model.dart';
import 'package:member_app/features/food/data/demo_data/demo_food_menu_data.dart';
import 'package:member_app/features/food/data/demo_data/demo_meal_data.dart';

import 'package:member_app/utils/dateutil.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

abstract class IMealsRepository {
  Future<List<MealDataModel>> getMonthlyMeals({
    required int month,
    int? year,
  });
  Future<List<FoodMenu>> getMealList();
}

class FakeMealRepository extends IMealsRepository {
  @override
  Future<List<MealDataModel>> getMonthlyMeals({
    required int month,
    int? year,
  }) async {
    final List<MealDataModel> _fmeals = [];
    final List<MealDataModel> _meals = [];
    // ignore: avoid_dynamic_calls
    await Future.delayed(const Duration(seconds: 2), () {
      jsonDecode(demoMealsRaw).forEach((element) {
        _fmeals.add(MealDataModel.fromMap(element));
      });
    });

    for (final element in _fmeals) {
      if (int.parse(element.month!) == month) {
        if (_meals.isNotEmpty) {
          if (int.parse(_meals.last.dats!) < int.parse(element.dats!)) {
            _meals.add(element);
          } else if (int.parse(_meals.last.dats!) == int.parse(element.dats!)) {
            if (element.dinner == '1') {
              _meals.last.dinner = '1';
            }
            if (element.lunch == '1') {
              _meals.last.lunch = '1';
            }
            if (element.breakfast == '1') {
              _meals.last.breakfast = '1';
            }
          }
        } else {
          _meals.add(element);
        }
      }
    }

    return _meals;
  }

  @override
  Future<List<FoodMenu>> getMealList() async {
    final List<FoodMenu> _foodMenuTemp = [];
    List<FoodMenu> _foodMenu = [];
    String week = '';
    await Future.delayed(const Duration(seconds: 2), () {
      jsonDecode(demoFoodMenuData).forEach((element) {
        _foodMenuTemp.add(FoodMenu.fromMap(element));
      });
    });
    if (DateTime.now().day <= 7) {
      week = 'First';
    } else if (DateTime.now().day >= 8 && DateTime.now().day <= 14) {
      week = 'Second';
    } else if (DateTime.now().day >= 15 && DateTime.now().day <= 21) {
      week = 'Third';
    } else {
      week = 'Fourth';
    }

    int? bfindex;
    int? lunindex;
    int? dinIndex;

    for (final element in _foodMenuTemp) {
      if (element.week != null) {
        //live Logic element.week == week
        if (element.day!.toLowerCase() ==
            KELtDateUtil.getDayName(DateTime.now()).toLowerCase()) {
          if (element.meal_type!.toLowerCase() == 'Breakfast'.toLowerCase()) {
            if (bfindex == null) {
              _foodMenu.add(element);
              bfindex = _foodMenu.length - 1;
            } else if (int.parse(_foodMenu[bfindex].id!) <
                int.parse(element.id!)) {
              _foodMenu[bfindex] = element;
            }
          } else if (element.meal_type!.toLowerCase() ==
              'Lunch'.toLowerCase()) {
            if (lunindex == null) {
              _foodMenu.add(element);
              lunindex = _foodMenu.length - 1;
            } else if (int.parse(_foodMenu[lunindex].id!) <
                int.parse(element.id!)) {
              _foodMenu[lunindex] = element;
            }
          } else if (element.meal_type!.toLowerCase() ==
              'Dinner'.toLowerCase()) {
            if (dinIndex == null) {
              _foodMenu.add(element);
              dinIndex = _foodMenu.length - 1;
            } else if (int.parse(_foodMenu[dinIndex].id!) <
                int.parse(element.id!)) {
              _foodMenu[dinIndex] = element;
            }
          }
        }
      }
    }

    return _foodMenu;
  }
}
