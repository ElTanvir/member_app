// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable
class TransactionModel {
  int id;
  String booking_id;
  String transaction_id;
  int amount;
  String transaction_type;
  String category;
  String by;
  String entry_date;
  TransactionModel({
    required this.id,
    required this.booking_id,
    required this.transaction_id,
    required this.amount,
    required this.transaction_type,
    required this.category,
    required this.by,
    required this.entry_date,
  });

  TransactionModel copyWith({
    int? id,
    String? booking_id,
    String? transaction_id,
    int? amount,
    String? transaction_type,
    String? category,
    String? by,
    String? entry_date,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      booking_id: booking_id ?? this.booking_id,
      transaction_id: transaction_id ?? this.transaction_id,
      amount: amount ?? this.amount,
      transaction_type: transaction_type ?? this.transaction_type,
      category: category ?? this.category,
      by: by ?? this.by,
      entry_date: entry_date ?? this.entry_date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'booking_id': booking_id,
      'transaction_id': transaction_id,
      'amount': amount,
      'transaction_type': transaction_type,
      'category': category,
      'by': by,
      'entry_date': entry_date,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id']?.toInt() ?? 0,
      booking_id: map['booking_id'] ?? '',
      transaction_id: map['transaction_id'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      transaction_type: map['transaction_type'] ?? '',
      category: map['category'] ?? '',
      by: map['by'] ?? '',
      entry_date: map['entry_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(id: $id, booking_id: $booking_id, transaction_id: $transaction_id, amount: $amount, transaction_type: $transaction_type, category: $category, by: $by, entry_date: $entry_date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.id == id &&
        other.booking_id == booking_id &&
        other.transaction_id == transaction_id &&
        other.amount == amount &&
        other.transaction_type == transaction_type &&
        other.category == category &&
        other.by == by &&
        other.entry_date == entry_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        booking_id.hashCode ^
        transaction_id.hashCode ^
        amount.hashCode ^
        transaction_type.hashCode ^
        category.hashCode ^
        by.hashCode ^
        entry_date.hashCode;
  }
}
