import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:member_app/features/core/logic/home_button_controller.dart';
import 'package:member_app/features/core/views/neu_button.dart';
import 'package:member_app/features/core/views/profile_page.dart';
import 'package:member_app/features/core/views/rent_page.dart';
import 'package:member_app/features/food/views/food_page.dart';
import 'package:member_app/features/transactions/views/transactions_page.dart';
import 'package:member_app/utils/constants.dart';

class CoreView extends StatelessWidget {
  const CoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceheight = MediaQuery.of(context).size.height -
        10 -
        MediaQuery.of(context).padding.top;
    final double devicewidth = MediaQuery.of(context).size.width - 20;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          10,
          MediaQuery.of(context).padding.top,
          10,
          MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            child: SizedBox(
                              height: deviceheight * 0.1,
                              width: deviceheight * 0.1,
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'http://erp.superhomebd.com/super_home/assets/uploads/member/member_image/FILES_IMAGE_MEMBER_11_06_2021_3454885269306767502_204752401513206336.png',
                                ),
                                radius: 10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const ProfileCardItem(
                            icon: Icons.person,
                            title: 'Md.Tanbin Hossain Hridoy',
                          ),
                          const ProfileCardItem(
                            icon: Icons.work,
                            title: 'Job Holder',
                          ),
                          const ProfileCardItem(
                            icon: Icons.phone,
                            title: '01737760404',
                          ),
                          const ProfileCardItem(
                            icon: Icons.loyalty,
                            title: '0',
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
                        final int indexProvider =
                            ref.watch(homePageButtonIndexProvider);
                        final indexsetter =
                            ref.watch(homePageButtonIndexProvider.notifier);
                        return Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          runAlignment: WrapAlignment.spaceEvenly,
                          children: [
                            NeuButton(
                              icon: Icons.home,
                              onPressed: () {
                                indexsetter.StateValue = 0;
                              },
                              buttonSize: devicewidth * 0.55 * 0.3,
                              isChosen: indexProvider == 0,
                            ),
                            NeuButton(
                              icon: Icons.person,
                              onPressed: () {
                                indexsetter.StateValue = 1;
                              },
                              buttonSize: devicewidth * 0.55 * 0.3,
                              isChosen: indexProvider == 1,
                            ),
                            NeuSvgButton(
                              icon: SvgPicture.asset(
                                'assets/images/rent_Icon.svg',
                                color: KEltColor.primary,
                                height: devicewidth * 0.55 * 0.3 * 0.6,
                                width: devicewidth * 0.55 * 0.3 * 0.6,
                              ),
                              onPressed: () {
                                indexsetter.StateValue = 2;
                              },
                              buttonSize: devicewidth * 0.55 * 0.3,
                              isChosen: indexProvider == 2,
                            ),
                            NeuButton(
                              icon: Icons.food_bank,
                              onPressed: () {
                                indexsetter.StateValue = 3;
                              },
                              buttonSize: devicewidth * 0.55 * 0.3,
                              isChosen: indexProvider == 3,
                            ),
                            NeuButton(
                              icon: Icons.receipt_long,
                              onPressed: () {
                                indexsetter.StateValue = 4;
                              },
                              buttonSize: devicewidth * 0.55 * 0.3,
                              isChosen: indexProvider == 4,
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
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final int indexProvider =
                      ref.watch(homePageButtonIndexProvider);
                  return IndexedStack(
                    index: indexProvider,
                    children: [
                      Container(
                        decoration: KEltDecoration.boxDecoration1,
                        child: Center(
                          child: Text(indexProvider.toString()),
                        ),
                      ),
                      const Profilewidget(),
                      const RentPage(),
                      const FoodView(),
                      const TransactionsPage(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
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
