import 'package:flutter/material.dart';
import 'package:member_app/utils/constants.dart';

class Profilewidget extends StatelessWidget {
  const Profilewidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const ProfileWidgetTitle(
                title: 'Email',
                description: '01737760404@gmail.com',
              ),
              const ProfileWidgetTitle(
                title: 'Religion	',
                description: 'Islam',
              ),
              const ProfileWidgetTitle(
                title: 'Father name',
                description: 'Md.Amjad Hossen',
              ),
              const ProfileWidgetTitle(
                title: 'Address',
                description:
                    'Village Gulsan Nagor Bhavon Post Office Parbotipur Police Station Parbotipur District Dinajpur Country Bangladesh',
              ),
              const ProfileWidgetTitle(
                title: 'Emergency Name',
                description: 'Daliya Shultana',
              ),
              const ProfileWidgetTitle(
                title: 'Emergency Number',
                description: '01761956182',
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
              const ProfileWidgetTitle(
                title: 'Branch',
                description: 'Super Home 8',
              ),
              const ProfileWidgetTitle(
                title: 'Floor',
                description: '6th Floor',
              ),
              const ProfileWidgetTitle(
                title: 'Unit',
                description: 'A6',
              ),
              const ProfileWidgetTitle(
                title: 'Room',
                description: 'R3',
              ),
              const ProfileWidgetTitle(
                title: 'Bed Type',
                description: 'Cozy',
              ),
              const ProfileWidgetTitle(
                title: 'Bed',
                description: 'A6R3SB1',
              ),
              const ProfileWidgetTitle(
                title: 'Booking Date',
                description: '12/01/2020 01:47:31 PM',
              ),
              const ProfileWidgetTitle(
                title: 'CheckIn Date',
                description: '01/12/2020',
              ),
              const ProfileWidgetTitle(
                title: 'CheckOut Date',
                description: 'Not Confirm Yet',
              ),
              const ProfileWidgetTitle(
                title: 'Card Number',
                description: '0013171849',
              ),
              const ProfileWidgetTitle(
                title: 'Package',
                description: 'Diamond',
              ),
              const ProfileWidgetTitle(
                title: 'Security Diposit',
                description: 'BDT 20,000',
              ),
              const ProfileWidgetTitle(
                title: 'Parking',
                description: 'NO',
              ),
              const ProfileWidgetTitle(
                title: 'Booked By',
                description: 'Md. Ibrahim Khalil',
              ),
            ],
          ),
        ),
      ),
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
