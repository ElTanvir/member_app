import 'package:flutter/material.dart';

class NoRecordWidget extends StatelessWidget {
  const NoRecordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No Record Found'),
    );
  }
}

class ErrorHandleWidget extends StatelessWidget {
  const ErrorHandleWidget({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
