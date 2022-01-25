import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:member_app/features/core/logic/core_provider.dart';
import 'package:member_app/features/core/views/neu_button.dart';
import 'package:member_app/features/core/views/profile_page.dart';
import 'package:member_app/features/food/views/food_page.dart';
import 'package:member_app/features/newsportal/views/newsportal_page.dart';
import 'package:member_app/features/requests/views/requests_page.dart';
import 'package:member_app/features/transactions/views/transactions_page.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/loader_v2.dart';
import 'package:member_app/utils/string_constants.dart';
import 'package:member_app/utils/utility_provider.dart';
import 'package:member_app/utils/widgets.dart';

class CoreView extends ConsumerWidget {
  const CoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceheight = MediaQuery.of(context).size.height -
        10 -
        MediaQuery.of(context).padding.top;
    final double devicewidth = MediaQuery.of(context).size.width - 20;

    return WillPopScope(
      onWillPop: () async => Future.value(false),
      child: ValueListenableBuilder(
        builder: (context, box, widget) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                10,
                MediaQuery.of(context).padding.top,
                10,
                MediaQuery.of(context).padding.bottom,
              ),
              child: ref.watch(userProvider).map(
                    initial: (_) => const Center(child: LoaderV2()),
                    loading: (_) => const Center(child: LoaderV2()),
                    loaded: (response) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: deviceheight * 0.3,
                            width: devicewidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: devicewidth * 0.45,
                                  decoration: KEltDecoration.boxDecoration1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          child: SizedBox(
                                            height: deviceheight * 0.1,
                                            width: deviceheight * 0.1,
                                            child: response.data.photo != null
                                                ? CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                      '${ref.watch(baseImageUrlProvider)}${response.data.photo}',
                                                    ),
                                                    radius: 10,
                                                  )
                                                : Icon(
                                                    Icons.person,
                                                    size: deviceheight * 0.09,
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ProfileCardItem(
                                          icon: Icons.person,
                                          title: response.data.full_name,
                                        ),
                                        ProfileCardItem(
                                          icon: Icons.work,
                                          title: response.data.occupation,
                                        ),
                                        ProfileCardItem(
                                          icon: Icons.phone,
                                          title: response.data.phone_number,
                                        ),
                                        ProfileCardItem(
                                          icon: Icons.loyalty,
                                          title: response.data.security_deposite
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: devicewidth * 0.55,
                                  height: deviceheight * 0.3,
                                  child: Consumer(
                                    builder: (
                                      BuildContext context,
                                      WidgetRef ref,
                                      Widget? child,
                                    ) {
                                      final int indexProvider = ref
                                          .watch(homePageButtonIndexProvider);
                                      final indexsetter = ref.watch(
                                        homePageButtonIndexProvider.notifier,
                                      );
                                      return Wrap(
                                        alignment: WrapAlignment.spaceEvenly,
                                        runAlignment: WrapAlignment.spaceEvenly,
                                        children: [
                                          NeuButton(
                                            icon: Icons.home,
                                            onPressed: () {
                                              indexsetter.StateValue = 0;
                                            },
                                            buttonSize:
                                                devicewidth * 0.55 * 0.3,
                                            isChosen: indexProvider == 0,
                                          ),
                                          NeuButton(
                                            icon: Icons.notifications,
                                            onPressed: () {
                                              indexsetter.StateValue = 1;
                                            },
                                            buttonSize:
                                                devicewidth * 0.55 * 0.3,
                                            isChosen: indexProvider == 1,
                                          ),
                                          NeuButton(
                                            icon: Icons.person,
                                            onPressed: () {
                                              indexsetter.StateValue = 2;
                                            },
                                            buttonSize:
                                                devicewidth * 0.55 * 0.3,
                                            isChosen: indexProvider == 2,
                                          ),
                                          NeuButton(
                                            icon: Icons.food_bank,
                                            onPressed: () {
                                              indexsetter.StateValue = 3;
                                            },
                                            buttonSize:
                                                devicewidth * 0.55 * 0.3,
                                            isChosen: indexProvider == 3,
                                          ),
                                          NeuButton(
                                            icon: Icons.attach_money,
                                            onPressed: () {
                                              indexsetter.StateValue = 4;
                                            },
                                            buttonSize:
                                                devicewidth * 0.55 * 0.3,
                                            isChosen: indexProvider == 4,
                                          ),
                                          NeuButton(
                                            icon: Icons.settings,
                                            onPressed: () {
                                              indexsetter.StateValue = 5;
                                            },
                                            buttonSize:
                                                devicewidth * 0.55 * 0.3,
                                            isChosen: indexProvider == 5,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: deviceheight * 0.68,
                            width: devicewidth,
                            child: Consumer(
                              builder: (
                                BuildContext context,
                                WidgetRef ref,
                                Widget? child,
                              ) {
                                final int indexProvider =
                                    ref.watch(homePageButtonIndexProvider);
                                return IndexedStack(
                                  index: indexProvider,
                                  children: [
                                    const NewsPortalPage(),
                                    Container(
                                      decoration: KEltDecoration.boxDecoration1,
                                      child: const Center(
                                        child: Text('Notification Page'),
                                      ),
                                    ),
                                    const Profilewidget(),
                                    const FoodView(),
                                    const TransactionsPage(),
                                    const RequestsPage(),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                    error: (_) => ErrorHandleWidget(error: _.error),
                  ),
            ),
          );
        },
        valueListenable: Hive.box(StringConstants.authBox).listenable(),
      ),
    );
  }
}

class ProfileCardItem extends StatelessWidget {
  const ProfileCardItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            icon,
            color: KEltTextStyle.subtitleText.color,
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            child: Text(
              title,
              style: KEltTextStyle.subtitleText,
            ),
          ),
        ],
      ),
    );
  }
}
