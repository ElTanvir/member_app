import 'package:flutter/material.dart';
import 'package:member_app/features/core/data/dummy_rental_info.dart';
import 'package:member_app/utils/constants.dart';

class RentPage extends StatelessWidget {
  const RentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KEltDecoration.boxDecoration1,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: KEltDecoration.boxDecoration1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Rental Information',
                style: KEltTextStyle.titleText,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dummyRenTalInfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
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
                                Text(
                                  'Month: ${dummyRenTalInfo[index].rental_month!}',
                                  style: KEltTextStyle.subtitleText,
                                ),
                                Text(
                                  'Recharge Days: ${dummyRenTalInfo[index].recharge_days!}',
                                  style: KEltTextStyle.subtitleText,
                                ),
                                Text(
                                  'Payment Date: ${dummyRenTalInfo[index].payment_date!}',
                                  style: KEltTextStyle.subtitleText,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Package: ${dummyRenTalInfo[index].package!}',
                                  style: KEltTextStyle.subtitleText,
                                ),
                                Text(
                                  'Rent Amount: ${dummyRenTalInfo[index].rent_amount!}',
                                  style: KEltTextStyle.subtitleText,
                                ),
                                Text(
                                  'Status: ${dummyRenTalInfo[index].status!}',
                                  style: KEltTextStyle.subtitleText,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
