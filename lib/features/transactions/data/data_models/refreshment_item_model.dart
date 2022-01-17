import 'dart:convert';

import 'package:member_app/features/transactions/data/data_models/refreshment_item_model_d.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable,avoid_dynamic_calls

class RefreshmentItemModel {
  int qty;
  int amount;
  RefreshmentItemModel({
    required this.qty,
    required this.amount,
    required this.refreshment_item,
  });
  RefreshmentItemModeldown refreshment_item;

  Map<String, dynamic> toMap() {
    return {
      'qty': qty,
      'amount': amount,
      'refreshment_item': refreshment_item.toMap()
    };
  }

  factory RefreshmentItemModel.fromMap(Map<String, dynamic> map) {
    return RefreshmentItemModel(
      qty: map['qty']?.toInt() ?? 0,
      amount: map['amount']?.toInt() ?? 0,
      refreshment_item:
          RefreshmentItemModeldown.fromMap(map['refreshment_item'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshmentItemModel.fromJson(String source) =>
      RefreshmentItemModel.fromMap(json.decode(source));
}
