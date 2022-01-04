import 'dart:convert';

import 'package:member_app/features/transactions/data/data_models/payment_data_model.dart';
import 'package:member_app/features/transactions/data/data_models/refreshmentitem_purchase_model.dart';
import 'package:member_app/features/transactions/data/dummy_data/dummy_refreshment_items_data.dart';
import 'package:member_app/features/transactions/data/dummy_data/dummy_transaction_data.dart';

abstract class ITransactionRepository {
  Future<List<RefreshmentItemPurchaseModel>> getRefreshmentItemPurchaseList();
  Future<List<PaymentDataModel>> getPaymentData();
}

class FakeTransactions extends ITransactionRepository {
  @override
  Future<List<RefreshmentItemPurchaseModel>>
      getRefreshmentItemPurchaseList() async {
    final List<RefreshmentItemPurchaseModel> itempurchase = [];
    await Future.delayed(const Duration(seconds: 2), () {
      // ignore: avoid_dynamic_calls ,
      jsonDecode(dummyRefreshMentData).forEach((element) {
        // ignore: argument_type_not_assignable
        itempurchase.add(RefreshmentItemPurchaseModel.fromMap(element));
      });
    });
    return itempurchase;
  }

  @override
  Future<List<PaymentDataModel>> getPaymentData() async {
    final List<PaymentDataModel> paymentData = [];
    await Future.delayed(const Duration(seconds: 2), () {
      // ignore: avoid_dynamic_calls ,
      jsonDecode(dummyTransactionData).forEach((element) {
        // ignore: argument_type_not_assignable
        paymentData.add(PaymentDataModel.fromMap(element));
      });
    });
    return paymentData;
  }
}
