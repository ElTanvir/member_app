import 'package:flutter/material.dart';
import 'package:member_app/features/requests/views/bed_change_page.dart';
import 'package:member_app/features/requests/views/package_change_page.dart';
import 'package:member_app/utils/constants.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KEltDecoration.boxDecoration1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: TabBar(
                unselectedLabelColor: KEltColor.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      KEltColor.primary,
                      KEltColor.primary.withOpacity(0.6)
                    ],
                  ),

                  borderRadius: BorderRadius.circular(10), // Creates border
                ),
                tabs: const [
                  Tab(
                    text: 'Package Change Logs',
                  ),
                  Tab(
                    text: 'Bed Change Logs',
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [PackageChangePage(), BedChangePage()],
            ),
          ),
        ),
      ),
    );
  }
}
