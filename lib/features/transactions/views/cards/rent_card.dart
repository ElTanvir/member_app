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
                        'Date: ${rentInfo.date}',
                        style: KEltTextStyle.titleText,
                      ),
                    ),
                    RentCardTextWidget(text: 'Month: ${rentInfo.rental_month}'),
                    RentCardTextWidget(
                      text:
                          'Package: ${rentInfo.id} - ${rentInfo.package_name}', //TODO: FIX
                    ),
                    RentCardTextWidget(
                      text: 'Amount: ${rentInfo.rent_amount} BDT',
                    ),
                    RentCardTextWidget(text: 'Status: ${rentInfo.rent_status}'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RentCardTextWidget(
                      text:
                          'Rent Amount: ${(rentInfo.rent_amount == '') ? '0' : rentInfo.rent_amount} BDT',
                    ),
                    RentCardTextWidget(
                      text:
                          'Electricity: ${(rentInfo.date == '') ? '0' : rentInfo.date} BDT', //TODO: FIX
                    ),
                    RentCardTextWidget(
                      text:
                          'Parking: ${(rentInfo.date == '') ? '0' : rentInfo.date} BDT',
                    ),
                    RentCardTextWidget(
                      text:
                          'Locker: ${(rentInfo.date == '') ? '0' : rentInfo.date} BDT',
                    ),
                    RentCardTextWidget(
                      text:
                          'Tea/Coffee: ${(rentInfo.date == '') ? '0' : rentInfo.date} BDT',
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
