import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/transactions/data/refreshment_item_model.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class RefreshmentItemPurchaseModel {
  String? id;
  String? branch_id;
  String? branch_name;
  String? buyer_id;
  String? booking_id;
  String? buying_code;
  String? total_qty;
  String? total_amount;
  String? payment_status;
  String? day;
  String? month;
  String? year;
  String? note;
  String? status;
  String? uploader_info;
  String? data;
  List<RefreshmentItemModel> items;
  RefreshmentItemPurchaseModel({
    this.id,
    this.branch_id,
    this.branch_name,
    this.buyer_id,
    this.booking_id,
    this.buying_code,
    this.total_qty,
    this.total_amount,
    this.payment_status,
    this.day,
    this.month,
    this.year,
    this.note,
    this.status,
    this.uploader_info,
    this.data,
    required this.items,
  });

  RefreshmentItemPurchaseModel copyWith({
    String? id,
    String? branch_id,
    String? branch_name,
    String? buyer_id,
    String? booking_id,
    String? buying_code,
    String? total_qty,
    String? total_amount,
    String? payment_status,
    String? day,
    String? month,
    String? year,
    String? note,
    String? status,
    String? uploader_info,
    String? data,
    List<RefreshmentItemModel>? items,
  }) {
    return RefreshmentItemPurchaseModel(
      id: id ?? this.id,
      branch_id: branch_id ?? this.branch_id,
      branch_name: branch_name ?? this.branch_name,
      buyer_id: buyer_id ?? this.buyer_id,
      booking_id: booking_id ?? this.booking_id,
      buying_code: buying_code ?? this.buying_code,
      total_qty: total_qty ?? this.total_qty,
      total_amount: total_amount ?? this.total_amount,
      payment_status: payment_status ?? this.payment_status,
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
      note: note ?? this.note,
      status: status ?? this.status,
      uploader_info: uploader_info ?? this.uploader_info,
      data: data ?? this.data,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'branch_id': branch_id,
      'branch_name': branch_name,
      'buyer_id': buyer_id,
      'booking_id': booking_id,
      'buying_code': buying_code,
      'total_qty': total_qty,
      'total_amount': total_amount,
      'payment_status': payment_status,
      'day': day,
      'month': month,
      'year': year,
      'note': note,
      'status': status,
      'uploader_info': uploader_info,
      'data': data,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory RefreshmentItemPurchaseModel.fromMap(Map<String, dynamic> map) {
    return RefreshmentItemPurchaseModel(
      id: map['id'],
      branch_id: map['branch_id'],
      branch_name: map['branch_name'],
      buyer_id: map['buyer_id'],
      booking_id: map['booking_id'],
      buying_code: map['buying_code'],
      total_qty: map['total_qty'],
      total_amount: map['total_amount'],
      payment_status: map['payment_status'],
      day: map['day'],
      month: map['month'],
      year: map['year'],
      note: map['note'],
      status: map['status'],
      uploader_info: map['uploader_info'],
      data: map['data'],
      items: List<RefreshmentItemModel>.from(
          map['items']?.map((x) => RefreshmentItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshmentItemPurchaseModel.fromJson(String source) =>
      RefreshmentItemPurchaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RefreshmentItemPurchaseModel(id: $id, branch_id: $branch_id, branch_name: $branch_name, buyer_id: $buyer_id, booking_id: $booking_id, buying_code: $buying_code, total_qty: $total_qty, total_amount: $total_amount, payment_status: $payment_status, day: $day, month: $month, year: $year, note: $note, status: $status, uploader_info: $uploader_info, data: $data, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RefreshmentItemPurchaseModel &&
        other.id == id &&
        other.branch_id == branch_id &&
        other.branch_name == branch_name &&
        other.buyer_id == buyer_id &&
        other.booking_id == booking_id &&
        other.buying_code == buying_code &&
        other.total_qty == total_qty &&
        other.total_amount == total_amount &&
        other.payment_status == payment_status &&
        other.day == day &&
        other.month == month &&
        other.year == year &&
        other.note == note &&
        other.status == status &&
        other.uploader_info == uploader_info &&
        other.data == data &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        branch_id.hashCode ^
        branch_name.hashCode ^
        buyer_id.hashCode ^
        booking_id.hashCode ^
        buying_code.hashCode ^
        total_qty.hashCode ^
        total_amount.hashCode ^
        payment_status.hashCode ^
        day.hashCode ^
        month.hashCode ^
        year.hashCode ^
        note.hashCode ^
        status.hashCode ^
        uploader_info.hashCode ^
        data.hashCode ^
        items.hashCode;
  }
}
