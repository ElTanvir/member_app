// ignore_for_file: non_constant_identifier_names,argument_type_not_assignable, avoid_dynamic_calls
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:member_app/features/auth/data/data_models/auth_model.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/contextless_nav.dart';
import 'package:member_app/utils/routes.dart';
import 'package:member_app/utils/string_constants.dart';

class LoginNotifier extends StateNotifier<ApiState<AuthModel>> {
  Dio dio;

  LoginNotifier(this.dio) : super(const ApiState.initial());

  Future<void> login({
    required String card_number,
    required String password,
  }) async {
    try {
      state = const ApiState.loading();
      final Response response = await dio.post(
        '/member_access',
        data: {
          'card_number': card_number,
          'password': password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      state = ApiState.loaded(
        data: AuthModel.fromMap(response.data),
      );
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}

class LogOutNotifier extends StateNotifier<ApiState<String>> {
  LogOutNotifier() : super(const ApiState.initial());

  Future<void> logout() async {
    state = const ApiState.loading();
    try {
      var authbox = Hive.box(StringConstants.authBox);
      if (authbox.isOpen) {
        authbox.clear();
      } else {
        authbox = await Hive.openBox(StringConstants.authBox);
        authbox.clear();
      }
      ContextLess.nav.pushReplacementNamed(Routes.login);
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}
