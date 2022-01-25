import 'package:flutter/material.dart';
import 'package:member_app/features/transactions/data/data_models/rent_info.dart';
import 'package:member_app/utils/constants.dart';

class RentCard extends StatelessWidget {
  const RentCard({
    Key? key,
    required this.rentInfo,
  }) : super(key: key);
  final RentInfo rentInfo;

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
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Month: ${rentInfo.rental_month}',
                        style: KEltTextStyle.titleText,
                      ),
                    ),
                    RentCardTextWidget(
                      text: 'Transaction ID: ${rentInfo.transaction_id}',
                    ),
                    RentCardTextWidget(
                      text:
                          'Package: ${rentInfo.package_category} - ${rentInfo.package}',
                    ),
                    RentCardTextWidget(
                      text: 'Amount: ${rentInfo.total_amount} BDT',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RentCardTextWidget(
                      text: 'Rent Amount: ${rentInfo.rent_amount} BDT',
                    ),
                    RentCardTextWidget(
                      text:
                          'Electricity: ${(rentInfo.electricity == '') ? '0' : rentInfo.electricity} BDT',
                    ),
                    RentCardTextWidget(
                      text:
                          'Parking: ${(rentInfo.parking == '') ? '0' : rentInfo.parking} BDT',
                    ),
                    RentCardTextWidget(
                      text:
                          'Locker: ${(rentInfo.locker == '') ? '0' : rentInfo.locker} BDT',
                    ),
                    RentCardTextWidget(
                      text:
                          'Tea/Coffee: ${(rentInfo.tea_coffee == '') ? '0' : rentInfo.tea_coffee} BDT',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RentCardTextWidget extends StatelessWidget {
  const RentCardTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        text,
        style: KEltTextStyle.subtitleText,
      ),
    );
  }
}
