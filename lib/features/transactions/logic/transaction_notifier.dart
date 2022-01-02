import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/transactions/data/refreshmentitem_purchase_model.dart';
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
      print(e);
      state = ApiState.error(error: NetworkExceptions.getDioException(e));
    }
  }
}