import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/core/views/ctckupper.dart';
import 'package:member_app/features/newsportal/logic/newsportal_provider.dart';
import 'package:member_app/features/newsportal/views/cards/news_card.dart';
import 'package:member_app/features/pagination/logic/pagination_provider.dart';
import 'package:member_app/features/pagination/views/pagination_page.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/loader_v2.dart';
import 'package:member_app/utils/widgets.dart';

class NewsPortalPage extends ConsumerWidget {
  const NewsPortalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String widgetname = 'newsportal';
    return Container(
      decoration: KEltDecoration.boxDecoration1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 50,
              child: ref.watch(newsCategoryProvider).map(
                    initial: (_) => const SizedBox(),
                    loading: (_) => const LoaderV2(),
                    loaded: (_) {
                      if (_.data.isNotEmpty) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _.data.length + 1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                splashColor: KEltColor.highLight,
                                onTap: () {
                                  ref
                                      .watch(
                                        newsCatProvider(widgetname).notifier,
                                      )
                                      .state = (index ==
                                          0)
                                      ? ''
                                      : _.data[index - 1].id.toString();
                                  ref
                                      .watch(
                                        paginationIndexProvider(
                                          widgetname,
                                        ).notifier,
                                      )
                                      .statevalue = 1;
                                },
                                child: Container(
                                  decoration: ((index == 0 &&
                                              ref.watch(
                                                    newsCatProvider(widgetname),
                                                  ) ==
                                                  '') ||
                                          (index != 0 &&
                                              ref.watch(
                                                    newsCatProvider(widgetname),
                                                  ) ==
                                                  _.data[index - 1].id
                                                      .toString()))
                                      ? KEltDecoration.innerShadow
                                      : KEltDecoration.boxDecoration1,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 20,
                                  ),
                                  child: Center(
                                      child: Text((index == 0)
                                          ? 'All'
                                          : _.data[index - 1].category_name)),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const NoRecordWidget();
                      }
                    },
                    error: (_) => ErrorHandleWidget(error: _.error),
                  ),
            ),
          ),
          Expanded(
            child: ref.watch(newsResponseProvider(widgetname)).map(
                  initial: (_) => const SizedBox(),
                  loading: (_) => const LoaderV2(),
                  loaded: (_) {
                    if (_.data.data.isNotEmpty) {
                      return PaginationView(
                        pagecount: _.data.last_page,
                        widgetName: widgetname,
                        child: ListView.builder(
                          itemCount: _.data.data.length,
                          itemBuilder: (context, index) => NewsCard(
                            newsModel: _.data.data[index],
                          ),
                        ),
                      );
                    } else {
                      return const NoRecordWidget();
                    }
                  },
                  error: (_) => ErrorHandleWidget(error: _.error),
                ),
          )
        ],
      ),
    );
  }
}
