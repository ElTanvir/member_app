import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/transactions/data/refreshmentitem_purchase_model.dart';
import 'package:member_app/features/transactions/logic/transaction_provider.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/constants.dart';

class RefreshmentItemsPurchaseView extends StatelessWidget {
  const RefreshmentItemsPurchaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: KEltDecoration.boxDecoration1,
      child: Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(refreshmentItemPurchaseProvider);

          return data.map(
            initial: (_) => const SizedBox(),
            loading: (_) => const CircularProgressIndicator(),
            loaded: (_) => ListView.builder(
              shrinkWrap: true,
              itemCount: _.data.length,
              itemBuilder: (context, index) => ListTile(
                title: RefreshmentItemCard(
                  refreshmentItemPurchaseMode: _.data[index],
                ),
              ),
            ),
            error: (_) => Text(
              NetworkExceptions.getErrorMessage(_.error),
            ),
          );
        },
      ),
    );
  }
}

class RefreshmentItemCard extends StatelessWidget {
  const RefreshmentItemCard({
    Key? key,
    required this.refreshmentItemPurchaseMode,
  }) : super(key: key);
  final RefreshmentItemPurchaseModel refreshmentItemPurchaseMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10, 20, 10),
      child: Container(
        decoration: KEltDecoration.boxDecoration1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: ${refreshmentItemPurchaseMode.data}',
                      style: KEltTextStyle.titleText,
                    ),
                    Text(
                      'Total: ${refreshmentItemPurchaseMode.total_amount} BDT',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Status: ${refreshmentItemPurchaseMode.payment_status}',
                      style: KEltTextStyle.subtitleText,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: refreshmentItemPurchaseMode.items
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Item Name : ${e.product_name}\nQTY : ${e.qty}\nAmount : ${e.amount} BDT',
                            style: KEltTextStyle.subtitleText,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
