import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/transactions/logic/transaction_provider.dart';
import 'package:member_app/features/transactions/views/cards/payment_card.dart';
import 'package:member_app/features/transactions/views/cards/refreshment_item_card.dart';
import 'package:member_app/features/transactions/views/cards/rent_card.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/loader_v2.dart';
import 'package:member_app/utils/loader_widget.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: TabBar(
            unselectedLabelColor: KEltColor.primary,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              gradient: LinearGradient(
                colors: [KEltColor.primary, KEltColor.primary.withOpacity(0.6)],
              ),

              borderRadius: BorderRadius.circular(10), // Creates border
            ),
            tabs: const [
              Tab(
                text: 'Refreshment Item',
              ),
              Tab(
                text: 'Rent Info',
              ),
              Tab(
                text: 'All Transaction',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Consumer(
                builder: (context, ref, child) {
                  final data = ref.watch(refreshmentItemPurchaseProvider);

                  return data.map(
                    initial: (_) => const SizedBox(),
                    loading: (_) => const LoaderV2(),
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
            ),
            Center(
              child: Consumer(
                builder: (context, ref, child) {
                  final glass = ref.watch(rentDataProvider);
                  return glass.map(
                    initial: (_) => const SizedBox(),
                    loading: (_) => const LoaderV2(),
                    loaded: (_) => ListView.builder(
                      itemCount: _.data.length,
                      itemBuilder: (context, index) => RentCard(
                        rentInfo: _.data[index],
                      ),
                    ),
                    error: (_) => Text(
                      NetworkExceptions.getErrorMessage(_.error),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Consumer(
                builder: (context, ref, child) {
                  final glass = ref.watch(purchaseDataPurchaseProvider);
                  return glass.map(
                    initial: (_) => const SizedBox(),
                    loading: (_) => const LoaderV2(),
                    loaded: (_) => ListView.builder(
                      itemCount: _.data.length,
                      itemBuilder: (context, index) => PaymentCard(
                        paymentDataModel: _.data[index],
                      ),
                    ),
                    error: (_) => Text(
                      NetworkExceptions.getErrorMessage(_.error),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
