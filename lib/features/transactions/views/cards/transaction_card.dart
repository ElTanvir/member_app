import 'package:flutter/material.dart';
import 'package:member_app/features/transactions/data/data_models/transaction_data_model.dart';
import 'package:member_app/utils/constants.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);
  final TransactionModel transactionModel;

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
                'Date: ${transactionModel.entry_date}',
                style: KEltTextStyle.titleText,
              ),
              Text(
                'Amount: ${transactionModel.amount} BDT',
                style: KEltTextStyle.subtitleText,
              ),
              Text(
                'Transaction ID: ${transactionModel.transaction_id}',
                style: KEltTextStyle.subtitleText,
              ),
              Text(
                'Category: ${transactionModel.category}',
                style: KEltTextStyle.subtitleText,
              ),
              Text(
                'Cash: ${transactionModel.transaction_type}',
                style: KEltTextStyle.subtitleText,
              ),
              Text(
                'BY: ${transactionModel.by}',
                style: KEltTextStyle.subtitleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
