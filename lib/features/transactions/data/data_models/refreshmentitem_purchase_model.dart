import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/transactions/data/data_models/refreshment_item_model.dart';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable,avoid_dynamic_calls

class RefreshmentItemPurchaseModel {
  String day;
  String month;
  String year;
  int total_qty;
  int total_amount;
  String payment_status;
  List<RefreshmentItemModel> refreshment_lists;
  RefreshmentItemPurchaseModel({
    required this.day,
    required this.month,
    required this.year,
    required this.total_qty,
    required this.total_amount,
    required this.payment_status,
    required this.refreshment_lists,
  });

  RefreshmentItemPurchaseModel copyWith({
    String? day,
    String? month,
    String? year,
    int? total_qty,
    int? total_amount,
    String? payment_status,
    List<RefreshmentItemModel>? refreshment_lists,
  }) {
    return RefreshmentItemPurchaseModel(
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
      total_qty: total_qty ?? this.total_qty,
      total_amount: total_amount ?? this.total_amount,
      payment_status: payment_status ?? this.payment_status,
      refreshment_lists: refreshment_lists ?? this.refreshment_lists,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'month': month,
      'year': year,
      'total_qty': total_qty,
      'total_amount': total_amount,
      'payment_status': payment_status,
      'refreshment_lists': refreshment_lists.map((x) => x.toMap()).toList(),
    };
  }

  factory RefreshmentItemPurchaseModel.fromMap(Map<String, dynamic> map) {
    return RefreshmentItemPurchaseModel(
      day: map['day'] ?? '',
      month: map['month'] ?? '',
      year: map['year'] ?? '',
      total_qty: map['total_qty']?.toInt() ?? 0,
      total_amount: map['total_amount']?.toInt() ?? 0,
      payment_status: map['payment_status'] ?? '',
      refreshment_lists: List<RefreshmentItemModel>.from(
          map['refreshment_lists']
              ?.map((x) => RefreshmentItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshmentItemPurchaseModel.fromJson(String source) =>
      RefreshmentItemPurchaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RefreshmentItemPurchaseModel(day: $day, month: $month, year: $year, total_qty: $total_qty, total_amount: $total_amount, payment_status: $payment_status, refreshment_lists: $refreshment_lists)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RefreshmentItemPurchaseModel &&
        other.day == day &&
        other.month == month &&
        other.year == year &&
        other.total_qty == total_qty &&
        other.total_amount == total_amount &&
        other.payment_status == payment_status &&
        listEquals(other.refreshment_lists, refreshment_lists);
  }

  @override
  int get hashCode {
    return day.hashCode ^
        month.hashCode ^
        year.hashCode ^
        total_qty.hashCode ^
        total_amount.hashCode ^
        payment_status.hashCode ^
        refreshment_lists.hashCode;
  }
}
