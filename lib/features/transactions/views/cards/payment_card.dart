import 'package:flutter/material.dart';
import 'package:member_app/features/transactions/data/data_models/payment_data_model.dart';
import 'package:member_app/utils/constants.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
    required this.paymentDataModel,
  }) : super(key: key);
  final PaymentDataModel paymentDataModel;

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
                    Text(
                      'Date: ${paymentDataModel.data}',
                      style: KEltTextStyle.titleText,
                    ),
                    Text(
                      'Category: ${paymentDataModel.transaction_category}',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Amount: ${paymentDataModel.amount} BDT',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Transaction ID: ${paymentDataModel.transaction_id}',
                      style: KEltTextStyle.subtitleText,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Amount: ${(paymentDataModel.card_amount == '') ? '0' : paymentDataModel.card_amount} BDT',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Cash: ${(paymentDataModel.cash_amount == '') ? '0' : paymentDataModel.cash_amount} BDT',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Mobile Banking: ${(paymentDataModel.mobile_amount == '') ? '0' : paymentDataModel.mobile_amount} BDT',
                      style: KEltTextStyle.subtitleText,
                    ),
                    Text(
                      'Cheque: ${(paymentDataModel.check_amount == '') ? '0' : paymentDataModel.check_amount} BDT',
                      style: KEltTextStyle.subtitleText,
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
