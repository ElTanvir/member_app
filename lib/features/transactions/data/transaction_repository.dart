import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:member_app/features/transactions/data/data_models/refreshment_data.dart';
import 'package:member_app/features/transactions/data/data_models/rent_info.dart';
import 'package:member_app/features/transactions/data/data_models/rent_response.dart';
import 'package:member_app/features/transactions/data/data_models/transaction_data_model.dart';
import 'package:member_app/features/transactions/data/dummy_data/dummy_refreshment_items_data.dart';
import 'package:member_app/features/transactions/data/dummy_data/dummy_rent_info.dart';
import 'package:member_app/features/transactions/data/dummy_data/dummy_transaction_data.dart';

abstract class ITransactionRepository {
  Future<RefreshmentDataResponse> getRefreshmentItemPurchaseList(
    Dio dio,
    int page,
  );
  Future<List<TransactionModel>> getPaymentData(Dio dio);
  Future<RentResponse> getRentData(
    Dio dio,
    int page,
  );
}

class FakeTransactions extends ITransactionRepository {
  @override
  Future<RefreshmentDataResponse> getRefreshmentItemPurchaseList(
    Dio dio,
    int page,
  ) async {
    RefreshmentDataResponse itempurchase =
        RefreshmentDataResponse(data: [], last_page: 1);
    await Future.delayed(const Duration(seconds: 2), () {
      itempurchase =
          // ignore: avoid_dynamic_calls , argument_type_not_assignable
          RefreshmentDataResponse.fromMap(jsonDecode(dummyRefreshMentData));
    });
    return itempurchase;
  }

  @override
  Future<List<TransactionModel>> getPaymentData(Dio dio) async {
    final List<TransactionModel> paymentData = [];
    await Future.delayed(const Duration(seconds: 2), () {
      // ignore: avoid_dynamic_calls ,
      jsonDecode(dummyTransactionData)['data'].forEach((element) {
        // ignore: argument_type_not_assignable
        paymentData.add(TransactionModel.fromMap(element));
      });
    });
    return paymentData;
  }

  @override
  Future<RentResponse> getRentData(
    Dio dio,
    int page,
  ) async {
    final RentResponse rentData = RentResponse(data: [], last_page: 1);
    await Future.delayed(const Duration(seconds: 2), () {
      // ignore: avoid_dynamic_calls ,
      jsonDecode(dymmyRentInfo).forEach((element) {
        // ignore: argument_type_not_assignable
        // rentData.add(RentInfo.fromMap(element));
      });
    });
    return rentData;
  }
}

class LiveTransactionRepo extends ITransactionRepository {
  @override
  Future<List<TransactionModel>> getPaymentData(Dio dio) async {
    final List<TransactionModel> data = [];
    final Response response = await dio.get('/transaction_logs');
    // ignore: avoid_dynamic_calls,argument_type_not_assignable,unused_local_variable
    for (final item in response.data['data']) {
      // ignore: argument_type_not_assignable
      data.add(TransactionModel.fromMap(item));
    }
    return data;
  }

  @override
  Future<RefreshmentDataResponse> getRefreshmentItemPurchaseList(
    Dio dio,
    int page,
  ) async {
    final Response response =
        await dio.get('/member_refreshment_items?page=$page');
    // ignore: avoid_dynamic_calls,argument_type_not_assignable,unused_local_variable
    return RefreshmentDataResponse.fromMap(response.data);
  }

  @override
  Future<RentResponse> getRentData(
    Dio dio,
    int page,
  ) async {
    final Response response = await dio.get('/member_rent_details?page=$page');
    // ignore: avoid_dynamic_calls,argument_type_not_assignable,unused_local_variable
    return RentResponse.fromMap(response.data['data']);
  }
}
