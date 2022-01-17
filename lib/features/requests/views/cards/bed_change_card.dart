import 'package:flutter/material.dart';
import 'package:member_app/features/requests/data/data_models/bed_chnage_model.dart';
import 'package:member_app/utils/constants.dart';

class BedChangeCard extends StatelessWidget {
  const BedChangeCard({
    Key? key,
    required this.bedChangeModel,
  }) : super(key: key);
  final BedChangeModel bedChangeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10, 20, 10),
      child: Container(
        decoration: KEltDecoration.boxDecoration1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Request Date: ${bedChangeModel.request_date}',
                style: KEltTextStyle.titleText,
              ),
              Text(
                'Change Date: ${bedChangeModel.change_date}',
                style: KEltTextStyle.titleText,
              ),
              Text(
                'From : ${bedChangeModel.before_bed}',
                style: KEltTextStyle.subtitleText,
              ),
              Text(
                'From : ${bedChangeModel.current_bed}',
                style: KEltTextStyle.subtitleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
