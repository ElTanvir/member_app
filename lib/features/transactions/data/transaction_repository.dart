import 'dart:convert';

import 'package:member_app/features/transactions/data/dummy_refreshment_items_data.dart';
import 'package:member_app/features/transactions/data/refreshmentitem_purchase_model.dart';

abstract class ITransactionRepository {
  Future<List<RefreshmentItemPurchaseModel>> getRefreshmentItemPurchaseList();
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
}
