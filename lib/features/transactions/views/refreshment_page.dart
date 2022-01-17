import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/pagination/views/pagination_page.dart';
import 'package:member_app/features/transactions/logic/transaction_provider.dart';
import 'package:member_app/features/transactions/views/cards/refreshment_item_card.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/loader_v2.dart';
import 'package:member_app/utils/widgets.dart';

class RefreshmentItemPage extends ConsumerWidget {
  const RefreshmentItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String widgetname = 'RefreshmentItemPage';
    final data = ref.watch(
      refreshmentItemPurchaseProvider(widgetname),
    );

    return data.map(
      initial: (_) => const SizedBox(),
      loading: (_) => const LoaderV2(),
      loaded: (_) {
        if (_.data.data.isNotEmpty) {
          return PaginationView(
            pagecount: _.data.last_page,
            widgetName: widgetname,
            child: ListView.builder(
              itemCount: _.data.data.length,
              itemBuilder: (context, index) => RefreshmentItemCard(
                refreshmentItemPurchaseMode: _.data.data[index],
              ),
            ),
          );
        } else {
          return const NoRecordWidget();
        }
      },
      error: (_) => ErrorHandleWidget(error: _.error),
    );
  }
}
