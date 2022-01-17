import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:member_app/utils/interceptors.dart';

final dioProvider = Provider((ref) {
  final Dio _dio = Dio();
  _dio.options.baseUrl = ref.watch(baseUrlProvider);
  _dio.options.connectTimeout = 10000;
  _dio.options.receiveTimeout = 10000;
  _dio.interceptors.add(ElTanvirInterceptors());
  return _dio;
});

final baseImageUrlProvider =
    Provider<String>((ref) => 'http://erp.superhostelbd.com/super_home/');
final baseUrlProvider = Provider<String>(
  (ref) => 'http://10.100.92.209/super_home_laravel/public/api',
);

class HiveInitStateNotifier extends StateNotifier<bool> {
  HiveInitStateNotifier() : super(false) {
    initHive();
  }

  Future<void> initHive() async {
    try {
      await Hive.initFlutter();
      state = true;
    } on Exception {
      state = false;
    }
  }
}

final hiveInitProvider = StateNotifierProvider<HiveInitStateNotifier, bool>(
  (ref) => HiveInitStateNotifier(),
);
