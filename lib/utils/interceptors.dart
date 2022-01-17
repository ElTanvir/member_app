import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:member_app/utils/contextless_nav.dart';
import 'package:member_app/utils/routes.dart';
import 'package:member_app/utils/string_constants.dart';

class ElTanvirInterceptors extends Interceptor {
  Box authHive = Hive.box(StringConstants.authBox);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!authHive.isOpen) {
      authHive = await Hive.openBox(StringConstants.authBox);
    }

    if (authHive.get('token') != null && authHive.get('token') != '') {
      options.headers['token'] = authHive.get('token');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // ignore: avoid_print
    print('Error ${err.message} => PATH: ${err.response?.realUri}');
    if (err.response?.statusCode == 401) {
      authHive.clear();

      ContextLess.nav.pushReplacementNamed(Routes.login);
    }

    return super.onError(err, handler);
  }
}
