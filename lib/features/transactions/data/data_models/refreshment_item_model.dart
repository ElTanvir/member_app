import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class RefreshmentItemModel {
  String? id;
  String? buer_code;
  String? product_code;
  String? product_name;
  String? qty;
  String? amount;
  String? data;
  RefreshmentItemModel({
    this.id,
    this.buer_code,
    this.product_code,
    this.product_name,
    this.qty,
    this.amount,
    this.data,
  });

  RefreshmentItemModel copyWith({
    String? id,
    String? buer_code,
    String? product_code,
    String? product_name,
    String? qty,
    String? amount,
    String? data,
  }) {
    return RefreshmentItemModel(
      id: id ?? this.id,
      buer_code: buer_code ?? this.buer_code,
      product_code: product_code ?? this.product_code,
      product_name: product_name ?? this.product_name,
      qty: qty ?? this.qty,
      amount: amount ?? this.amount,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'buer_code': buer_code,
      'product_code': product_code,
      'product_name': product_name,
      'qty': qty,
      'amount': amount,
      'data': data,
    };
  }

  factory RefreshmentItemModel.fromMap(Map<String, dynamic> map) {
    return RefreshmentItemModel(
      id: map['id'],
      buer_code: map['buer_code'],
      product_code: map['product_code'],
      product_name: map['product_name'],
      qty: map['qty'],
      amount: map['amount'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshmentItemModel.fromJson(String source) =>
      RefreshmentItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RefreshmentItemModel(id: $id, buer_code: $buer_code, product_code: $product_code, product_name: $product_name, qty: $qty, amount: $amount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RefreshmentItemModel &&
        other.id == id &&
        other.buer_code == buer_code &&
        other.product_code == product_code &&
        other.product_name == product_name &&
        other.qty == qty &&
        other.amount == amount &&
        other.data == data;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        buer_code.hashCode ^
        product_code.hashCode ^
        product_name.hashCode ^
        qty.hashCode ^
        amount.hashCode ^
        data.hashCode;
  }
}
