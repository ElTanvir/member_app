import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable
class PaymentDataModel {
  String? id;
  String? transaction_id;
  String? branch_id;
  String? booking_id;
  String? payment_method;
  String? details;
  String? card_amount;
  String? cash_amount;
  String? mobile_amount;
  String? check_amount;
  String? invoice_number;
  String? note;
  String? status;
  String? uploader_info;
  String? data;
  String? transaction_type;
  String? transaction_category;
  String? transaction_method;
  String? transaction_pk;
  String? data_one;
  String? data_two;
  String? data_three;
  String? amount;
  PaymentDataModel({
    this.id,
    this.transaction_id,
    this.branch_id,
    this.booking_id,
    this.payment_method,
    this.details,
    this.card_amount,
    this.cash_amount,
    this.mobile_amount,
    this.check_amount,
    this.invoice_number,
    this.note,
    this.status,
    this.uploader_info,
    this.data,
    this.transaction_type,
    this.transaction_category,
    this.transaction_method,
    this.transaction_pk,
    this.data_one,
    this.data_two,
    this.data_three,
    this.amount,
  });

  PaymentDataModel copyWith({
    String? id,
    String? transaction_id,
    String? branch_id,
    String? booking_id,
    String? payment_method,
    String? details,
    String? card_amount,
    String? cash_amount,
    String? mobile_amount,
    String? check_amount,
    String? invoice_number,
    String? note,
    String? status,
    String? uploader_info,
    String? data,
    String? transaction_type,
    String? transaction_category,
    String? transaction_method,
    String? transaction_pk,
    String? data_one,
    String? data_two,
    String? data_three,
    String? amount,
  }) {
    return PaymentDataModel(
      id: id ?? this.id,
      transaction_id: transaction_id ?? this.transaction_id,
      branch_id: branch_id ?? this.branch_id,
      booking_id: booking_id ?? this.booking_id,
      payment_method: payment_method ?? this.payment_method,
      details: details ?? this.details,
      card_amount: card_amount ?? this.card_amount,
      cash_amount: cash_amount ?? this.cash_amount,
      mobile_amount: mobile_amount ?? this.mobile_amount,
      check_amount: check_amount ?? this.check_amount,
      invoice_number: invoice_number ?? this.invoice_number,
      note: note ?? this.note,
      status: status ?? this.status,
      uploader_info: uploader_info ?? this.uploader_info,
      data: data ?? this.data,
      transaction_type: transaction_type ?? this.transaction_type,
      transaction_category: transaction_category ?? this.transaction_category,
      transaction_method: transaction_method ?? this.transaction_method,
      transaction_pk: transaction_pk ?? this.transaction_pk,
      data_one: data_one ?? this.data_one,
      data_two: data_two ?? this.data_two,
      data_three: data_three ?? this.data_three,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transaction_id': transaction_id,
      'branch_id': branch_id,
      'booking_id': booking_id,
      'payment_method': payment_method,
      'details': details,
      'card_amount': card_amount,
      'cash_amount': cash_amount,
      'mobile_amount': mobile_amount,
      'check_amount': check_amount,
      'invoice_number': invoice_number,
      'note': note,
      'status': status,
      'uploader_info': uploader_info,
      'data': data,
      'transaction_type': transaction_type,
      'transaction_category': transaction_category,
      'transaction_method': transaction_method,
      'transaction_pk': transaction_pk,
      'data_one': data_one,
      'data_two': data_two,
      'data_three': data_three,
      'amount': amount,
    };
  }

  factory PaymentDataModel.fromMap(Map<String, dynamic> map) {
    return PaymentDataModel(
      id: map['id'],
      transaction_id: map['transaction_id'],
      branch_id: map['branch_id'],
      booking_id: map['booking_id'],
      payment_method: map['payment_method'],
      details: map['details'],
      card_amount: map['card_amount'],
      cash_amount: map['cash_amount'],
      mobile_amount: map['mobile_amount'],
      check_amount: map['check_amount'],
      invoice_number: map['invoice_number'],
      note: map['note'],
      status: map['status'],
      uploader_info: map['uploader_info'],
      data: map['data'],
      transaction_type: map['transaction_type'],
      transaction_category: map['transaction_category'],
      transaction_method: map['transaction_method'],
      transaction_pk: map['transaction_pk'],
      data_one: map['data_one'],
      data_two: map['data_two'],
      data_three: map['data_three'],
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentDataModel.fromJson(String source) =>
      PaymentDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentDataModel(id: $id, transaction_id: $transaction_id, branch_id: $branch_id, booking_id: $booking_id, payment_method: $payment_method, details: $details, card_amount: $card_amount, cash_amount: $cash_amount, mobile_amount: $mobile_amount, check_amount: $check_amount, invoice_number: $invoice_number, note: $note, status: $status, uploader_info: $uploader_info, data: $data, transaction_type: $transaction_type, transaction_category: $transaction_category, transaction_method: $transaction_method, transaction_pk: $transaction_pk, data_one: $data_one, data_two: $data_two, data_three: $data_three, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentDataModel &&
        other.id == id &&
        other.transaction_id == transaction_id &&
        other.branch_id == branch_id &&
        other.booking_id == booking_id &&
        other.payment_method == payment_method &&
        other.details == details &&
        other.card_amount == card_amount &&
        other.cash_amount == cash_amount &&
        other.mobile_amount == mobile_amount &&
        other.check_amount == check_amount &&
        other.invoice_number == invoice_number &&
        other.note == note &&
        other.status == status &&
        other.uploader_info == uploader_info &&
        other.data == data &&
        other.transaction_type == transaction_type &&
        other.transaction_category == transaction_category &&
        other.transaction_method == transaction_method &&
        other.transaction_pk == transaction_pk &&
        other.data_one == data_one &&
        other.data_two == data_two &&
        other.data_three == data_three &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        transaction_id.hashCode ^
        branch_id.hashCode ^
        booking_id.hashCode ^
        payment_method.hashCode ^
        details.hashCode ^
        card_amount.hashCode ^
        cash_amount.hashCode ^
        mobile_amount.hashCode ^
        check_amount.hashCode ^
        invoice_number.hashCode ^
        note.hashCode ^
        status.hashCode ^
        uploader_info.hashCode ^
        data.hashCode ^
        transaction_type.hashCode ^
        transaction_category.hashCode ^
        transaction_method.hashCode ^
        transaction_pk.hashCode ^
        data_one.hashCode ^
        data_two.hashCode ^
        data_three.hashCode ^
        amount.hashCode;
  }
}
