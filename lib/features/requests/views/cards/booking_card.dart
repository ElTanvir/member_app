import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:member_app/features/requests/data/data_models/booking_package_details.dart';
import 'package:member_app/features/requests/views/cards/package_change_card.dart';
import 'package:member_app/features/transactions/views/cards/rent_card.dart';
import 'package:member_app/utils/constants.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({Key? key, required this.bookingPackageChageResponseModel})
      : super(key: key);
  final BookingPackageChageResponseModel bookingPackageChageResponseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: KEltDecoration.boxDecoration1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpandablePanel(
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RentCardTextWidget(
                  text:
                      'Booking ID : ${bookingPackageChageResponseModel.booking_id}',
                ),
                RentCardTextWidget(
                  text:
                      'Booking Package : ${bookingPackageChageResponseModel.package_category_name} - ${bookingPackageChageResponseModel.package_name}',
                ),
              ],
            ),
            collapsed: RentCardTextWidget(
              text: bookingPackageChageResponseModel
                      .package_change_infos.isEmpty
                  ? 'No Package Chnage Record Found'
                  : 'Total ${bookingPackageChageResponseModel.package_change_infos.length} Package Changes Found For this Booking. Tap To view them',
            ),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: bookingPackageChageResponseModel.package_change_infos
                  .map(
                    (e) => PackageChangeCard(
                      packageChangeDataModel: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
