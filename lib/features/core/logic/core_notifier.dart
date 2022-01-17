// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/core/data/data_models/user_model.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/services/network_exceptions.dart';
// ignore_for_file: non_constant_identifier_names,argument_type_not_assignable

class HomePageButtonIndex extends StateNotifier<int> {
  HomePageButtonIndex() : super(0);
  // ignore: avoid_setters_without_getters
  set StateValue(int value) {
    state = value;
  }
}

class UserNotifier extends StateNotifier<ApiState<UserModel>> {
  final Dio dio;
  UserNotifier(this.dio) : super(const ApiState.initial()) {
    getUserDetails();
  }
  Future<void> getUserDetails() async {
    state = const ApiState.loading();
    try {
      final Response response = await dio.get('/get_member_details');
      state = ApiState.loaded(data: UserModel.fromMap(response.data['data']));
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}
