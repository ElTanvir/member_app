import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/requests/data/data_models/bed_change_response.dart';
import 'package:member_app/features/requests/data/data_models/package_change_response_model.dart';
import 'package:member_app/features/requests/data/requests_repository.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/services/network_exceptions.dart';

class PackageChangeNotifier
    extends StateNotifier<ApiState<PackageChageResponseModel>> {
  final IRequestRepopsitory iRequestRepopsitory;
  final Dio dio;
  final int page;
  PackageChangeNotifier(this.iRequestRepopsitory, this.dio, this.page)
      : super(const ApiState.initial()) {
    getPackageShiftList();
  }
  Future<void> getPackageShiftList() async {
    try {
      state = const ApiState.loading();
      final data = await iRequestRepopsitory.getPackageChangeList(dio, page);
      state = ApiState.loaded(data: data);
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}

class BedChangeNotifier extends StateNotifier<ApiState<BedChangeResponse>> {
  final IRequestRepopsitory iRequestRepopsitory;
  final Dio dio;
  final int page;
  BedChangeNotifier(this.iRequestRepopsitory, this.dio, this.page)
      : super(const ApiState.initial()) {
    getBedShiftList();
  }
  Future<void> getBedShiftList() async {
    try {
      state = const ApiState.loading();
      final data = await iRequestRepopsitory.getBedChangeList(dio, page);
      state = ApiState.loaded(data: data);
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}
