import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/transactions/data/data_models/payment_data_model.dart';
import 'package:member_app/features/transactions/data/data_models/refreshmentitem_purchase_model.dart';
import 'package:member_app/features/transactions/data/transaction_repository.dart';
import 'package:member_app/features/transactions/logic/transaction_notifier.dart';
import 'package:member_app/services/api_state.dart';

final transcationRepoProvider = Provider<ITransactionRepository>(
  (ref) => FakeTransactions(),
); //Change This To Switch between Live data and localdata

final refreshmentItemPurchaseProvider = StateNotifierProvider.autoDispose<
    RefreshmentItemPurchaseNotifier,
    ApiState<List<RefreshmentItemPurchaseModel>>>(
  (ref) => RefreshmentItemPurchaseNotifier(ref.watch(transcationRepoProvider)),
);

final purchaseDataPurchaseProvider = StateNotifierProvider.autoDispose<
    PaymentDataNotifier, ApiState<List<PaymentDataModel>>>(
  (ref) => PaymentDataNotifier(ref.watch(transcationRepoProvider)),
);
