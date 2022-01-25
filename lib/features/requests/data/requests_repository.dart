import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:member_app/features/requests/data/data_models/bed_change_response.dart';
import 'package:member_app/features/requests/data/data_models/booking_package_details.dart';
import 'package:member_app/features/requests/data/dummy_data/bed_change_dummy_data.dart';

abstract class IRequestRepopsitory {
  Future<List<BookingPackageChageResponseModel>> getPackageChangeList(
    Dio dio,
  );
  Future<BedChangeResponse> getBedChangeList(Dio dio, int page);
}

class FakeRequestRepopsitory extends IRequestRepopsitory {
  @override
  Future<List<BookingPackageChageResponseModel>> getPackageChangeList(
    Dio dio,
  ) async {
    List<BookingPackageChageResponseModel> bedchange = [];
    await Future.delayed(const Duration(seconds: 2), () {
      // bedchange =
      //     // ignore: avoid_dynamic_calls,argument_type_not_assignable
      //     PackageChageResponseModel.fromMap(jsonDecode(dummyBedChangedata)); TODO: Gootta Change
    });
    return bedchange;
  }

  @override
  Future<BedChangeResponse> getBedChangeList(Dio dio, int page) async {
    BedChangeResponse bedchange = BedChangeResponse(data: [], last_page: 1);
    await Future.delayed(const Duration(seconds: 2), () {
      bedchange =
          // ignore: avoid_dynamic_calls,argument_type_not_assignable
          BedChangeResponse.fromMap(jsonDecode(dummyBedChangedata));
    });
    return bedchange;
  }
}

class LiveRequestRepopsitory extends IRequestRepopsitory {
  @override
  Future<List<BookingPackageChageResponseModel>> getPackageChangeList(
    Dio dio,
  ) async {
    final Response response = await dio.get('/package_change_loop');

    final List<BookingPackageChageResponseModel> data = [];
    for (final Map<String, dynamic> item in response.data['data']) {
      data.add(BookingPackageChageResponseModel.fromMap(item));
    }
    // ignore: avoid_dynamic_calls,argument_type_not_assignable
    return data;
  }

  @override
  Future<BedChangeResponse> getBedChangeList(Dio dio, int page) async {
    final Response response = await dio.get('/bed_change_logs?page=$page');
    // ignore: avoid_dynamic_calls,argument_type_not_assignable
    return BedChangeResponse.fromMap(response.data['data']);
  }
}
