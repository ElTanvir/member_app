import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/pagination/views/pagination_page.dart';
import 'package:member_app/features/requests/logic/requests_provider.dart';
import 'package:member_app/features/requests/views/cards/bed_change_card.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/loader_v2.dart';
import 'package:member_app/utils/widgets.dart';

class BedChangePage extends ConsumerWidget {
  const BedChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String widgetname = 'BedChangePage';
    return ref.watch(bedChangeListProvider(widgetname)).map(
          initial: (_) => const SizedBox(),
          loading: (_) => const Center(child: LoaderV2()),
          loaded: (_) {
            if (_.data.data.isNotEmpty) {
              return PaginationView(
                pagecount: _.data.last_page,
                widgetName: widgetname,
                child: ListView.builder(
                  itemCount: _.data.data.length,
                  itemBuilder: (context, index) => BedChangeCard(
                    bedChangeModel: _.data.data[index],
                  ),
                ),
              );
            } else {
              return const NoRecordWidget();
            }
          },
          error: (_) => Center(
            child: ErrorHandleWidget(error: _.error),
          ),
        );
  }
}
