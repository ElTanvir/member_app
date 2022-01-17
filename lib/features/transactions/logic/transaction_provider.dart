import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/pagination/logic/pagination_provider.dart';
import 'package:member_app/features/transactions/data/data_models/refreshment_data.dart';
import 'package:member_app/features/transactions/data/data_models/rent_info.dart';
import 'package:member_app/features/transactions/data/data_models/transaction_data_model.dart';
import 'package:member_app/features/transactions/data/transaction_repository.dart';
import 'package:member_app/features/transactions/logic/transaction_notifier.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/utils/utility_provider.dart';

final transcationRepoProvider = Provider<ITransactionRepository>(
  (ref) => LiveTransactionRepo(),
); //Change This To Switch between Live data and localdata

final refreshmentItemPurchaseProvider = StateNotifierProvider.family
    .autoDispose<RefreshmentItemPurchaseNotifier,
        ApiState<RefreshmentDataResponse>, String>(
  (ref, name) => RefreshmentItemPurchaseNotifier(
    ref.watch(transcationRepoProvider),
    ref.watch(dioProvider),
    ref.watch(paginationIndexProvider(name)),
  ),
);

final transactionDataPurchaseProvider = StateNotifierProvider.autoDispose<
    TransactonDataNotifier, ApiState<List<TransactionModel>>>(
  (ref) => TransactonDataNotifier(
    ref.watch(transcationRepoProvider),
    ref.watch(dioProvider),
  ),
);
final rentDataProvider = StateNotifierProvider.autoDispose<RentDataNotifier,
    ApiState<List<RentInfo>>>(
  (ref) => RentDataNotifier(
    ref.watch(transcationRepoProvider),
    ref.watch(dioProvider),
  ),
);
