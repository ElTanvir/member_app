import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/transactions/data/data_models/refreshment_data.dart';
import 'package:member_app/features/transactions/data/data_models/rent_info.dart';
import 'package:member_app/features/transactions/data/data_models/rent_response.dart';
import 'package:member_app/features/transactions/data/data_models/transaction_data_model.dart';
import 'package:member_app/features/transactions/data/transaction_repository.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/services/network_exceptions.dart';

class RefreshmentItemPurchaseNotifier
    extends StateNotifier<ApiState<RefreshmentDataResponse>> {
  final ITransactionRepository transactionRepository;
  final Dio dio;
  final int page;
  RefreshmentItemPurchaseNotifier(
    this.transactionRepository,
    this.dio,
    this.page,
  ) : super(const ApiState.initial()) {
    getMealMenu();
  }
  Future<void> getMealMenu() async {
    try {
      state = const ApiState.loading();
      final data =
          await transactionRepository.getRefreshmentItemPurchaseList(dio, page);
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

class TransactonDataNotifier
    extends StateNotifier<ApiState<List<TransactionModel>>> {
  final ITransactionRepository transactionRepository;
  final Dio dio;
  TransactonDataNotifier(this.transactionRepository, this.dio)
      : super(const ApiState.initial()) {
    getMealMenu();
  }
  Future<void> getMealMenu() async {
    try {
      state = const ApiState.loading();
      final data = await transactionRepository.getPaymentData(dio);
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

class RentDataNotifier extends StateNotifier<ApiState<RentResponse>> {
  final ITransactionRepository transactionRepository;
  final Dio dio;
  final int page;
  RentDataNotifier(this.transactionRepository, this.dio, this.page)
      : super(const ApiState.initial()) {
    getRentData();
  }
  Future<void> getRentData() async {
    try {
      state = const ApiState.loading();
      final data = await transactionRepository.getRentData(dio, page);
      state = ApiState.loaded(data: data);
    } catch (e) {
      print(e.toString());
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}
