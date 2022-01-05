import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/transactions/data/data_models/payment_data_model.dart';
import 'package:member_app/features/transactions/data/data_models/refreshmentitem_purchase_model.dart';
import 'package:member_app/features/transactions/data/data_models/rent_info.dart';
import 'package:member_app/features/transactions/data/transaction_repository.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/services/network_exceptions.dart';

class RefreshmentItemPurchaseNotifier
    extends StateNotifier<ApiState<List<RefreshmentItemPurchaseModel>>> {
  final ITransactionRepository transactionRepository;
  RefreshmentItemPurchaseNotifier(this.transactionRepository)
      : super(const ApiState.initial()) {
    getMealMenu();
  }
  Future<void> getMealMenu() async {
    try {
      state = const ApiState.loading();
      final data = await transactionRepository.getRefreshmentItemPurchaseList();
      state = ApiState.loaded(data: data);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      state = ApiState.error(error: NetworkExceptions.getDioException(e));
    }
  }
}

class PaymentDataNotifier
    extends StateNotifier<ApiState<List<PaymentDataModel>>> {
  final ITransactionRepository transactionRepository;
  PaymentDataNotifier(this.transactionRepository)
      : super(const ApiState.initial()) {
    getMealMenu();
  }
  Future<void> getMealMenu() async {
    try {
      state = const ApiState.loading();
      final data = await transactionRepository.getPaymentData();
      state = ApiState.loaded(data: data);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      state = ApiState.error(error: NetworkExceptions.getDioException(e));
    }
  }
}

class RentDataNotifier extends StateNotifier<ApiState<List<RentInfo>>> {
  final ITransactionRepository transactionRepository;
  RentDataNotifier(this.transactionRepository)
      : super(const ApiState.initial()) {
    getRentData();
  }
  Future<void> getRentData() async {
    try {
      state = const ApiState.loading();
      final data = await transactionRepository.getRentData();
      state = ApiState.loaded(data: data);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      state = ApiState.error(error: NetworkExceptions.getDioException(e));
    }
  }
}
