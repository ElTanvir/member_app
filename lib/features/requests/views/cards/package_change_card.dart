import 'package:flutter/material.dart';
import 'package:member_app/features/requests/data/data_models/package_change_data_model.dart';
import 'package:member_app/utils/constants.dart';

class PackageChangeCard extends StatelessWidget {
  const PackageChangeCard({
    Key? key,
    required this.packageChangeDataModel,
  }) : super(key: key);
  final PackageChangeDataModel packageChangeDataModel;

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
                'Request Date: ${packageChangeDataModel.request_date}',
                style: KEltTextStyle.titleText,
              ),
              Text(
                'Change Date: ${packageChangeDataModel.changed_date}',
                style: KEltTextStyle.titleText,
              ),
              Text(
                'From : ${packageChangeDataModel.old_category} - ${packageChangeDataModel.old_package}',
                style: KEltTextStyle.subtitleText,
              ),
              Text(
                'to : ${packageChangeDataModel.new_category} - ${packageChangeDataModel.new_package}',
                style: KEltTextStyle.subtitleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
