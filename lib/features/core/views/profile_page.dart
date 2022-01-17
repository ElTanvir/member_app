import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/auth/logic/auth_provider.dart';
import 'package:member_app/features/core/logic/core_provider.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/loader_v2.dart';
import 'package:member_app/utils/widgets.dart';

class Profilewidget extends ConsumerWidget {
  const Profilewidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userProvider).map(
          loaded: (value) => Container(
            decoration: KEltDecoration.boxDecoration1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: KEltDecoration.boxDecoration1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Personal Information',
                            style: KEltTextStyle.titleText,
                          ),
                        ),
                      ),
                    ),
                    ProfileWidgetTitle(
                      title: 'Email',
                      description: value.data.email,
                    ),
                    ProfileWidgetTitle(
                      title: 'Religion	',
                      description: value.data.religion,
                    ),
                    ProfileWidgetTitle(
                      title: 'Father name',
                      description: value.data.father_name,
                    ),
                    ProfileWidgetTitle(
                      title: 'Address', // TODO: Gotta Change Later
                      description: value.data.card_number,
                    ),
                    ProfileWidgetTitle(
                      title: 'Emergency Name',
                      description: value.data.emergency_number_1,
                    ),
                    ProfileWidgetTitle(
                      title: 'Emergency Number',
                      description: value.data.emergency_number_2,
                    ),
                    const Divider(
                      height: 40,
                      thickness: 2,
                      color: KEltColor.primary,
                      indent: 40,
                      endIndent: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: KEltDecoration.boxDecoration1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Booking Information',
                            style: KEltTextStyle.titleText,
                          ),
                        ),
                      ),
                    ),
                    ProfileWidgetTitle(
                      title: 'Branch',
                      description: value.data.branch_name,
                    ),
                    ProfileWidgetTitle(
                      title: 'Floor',
                      description: value.data.floor,
                    ),
                    ProfileWidgetTitle(
                      title: 'Unit',
                      description: value.data.unit,
                    ),
                    ProfileWidgetTitle(
                      title: 'Room',
                      description: value.data.room,
                    ),
                    ProfileWidgetTitle(
                      title: 'Bed Type',
                      description: value.data.bet_type,
                    ),
                    ProfileWidgetTitle(
                      title: 'Bed',
                      description: value.data.bed,
                    ),
                    ProfileWidgetTitle(
                      title: 'Booking Date',
                      description: value.data.booking_date,
                    ),
                    ProfileWidgetTitle(
                      title: 'CheckIn Date',
                      description: value.data.check_in_date,
                    ),
                    ProfileWidgetTitle(
                      title: 'CheckOut Date',
                      description: value.data.check_out_date,
                    ),
                    ProfileWidgetTitle(
                      title: 'Card Number',
                      description: value.data.card_number,
                    ),
                    ProfileWidgetTitle(
                      title: 'Package',
                      description: value.data.package_name,
                    ),
                    ProfileWidgetTitle(
                      title: 'Security Diposit',
                      description: value.data.security_deposite.toString(),
                    ),
                    ProfileWidgetTitle(
                      title: 'Parking',
                      description: value.data.parking,
                    ),
                    ProfileWidgetTitle(
                      title: 'Booked By',
                      description: value.data.booked_by,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return ref.watch(logOutProvider).map(
                              initial: (_) => Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    ref.watch(logOutProvider.notifier).logout();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: KEltDecoration.boxDecoration1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.logout,
                                            color: KEltColor.primary,
                                          ),
                                          Text(
                                            'Log Out',
                                            style: KEltTextStyle.titleText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              loading: (_) => const LoaderV2(),
                              loaded: (_) => const SizedBox(),
                              error: (_) => ErrorHandleWidget(error: _.error),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          error: (value) => ErrorHandleWidget(error: value.error),
          initial: (value) => const LoaderV2(),
          loading: (value) => const LoaderV2(),
        );
  }
}

class ProfileWidgetTitle extends StatelessWidget {
  const ProfileWidgetTitle({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: KEltTextStyle.titleText,
            ),
          ),
          Text(
            ' : ',
            style: KEltTextStyle.titleText,
          ),
          Expanded(
            flex: 3,
            child: Text(
              description,
              style: KEltTextStyle.subtitleText,
            ),
          ),
        ],
      ),
    );
  }
}
