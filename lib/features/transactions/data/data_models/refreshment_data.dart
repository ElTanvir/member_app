import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/transactions/data/data_models/refreshmentitem_purchase_model.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable,avoid_dynamic_calls

class RefreshmentDataResponse {
  List<RefreshmentItemPurchaseModel> data;
  int last_page;
  RefreshmentDataResponse({
    required this.data,
    required this.last_page,
  });

  RefreshmentDataResponse copyWith({
    List<RefreshmentItemPurchaseModel>? data,
    int? last_page,
  }) {
    return RefreshmentDataResponse(
      data: data ?? this.data,
      last_page: last_page ?? this.last_page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'last_page': last_page,
    };
  }

  factory RefreshmentDataResponse.fromMap(Map<String, dynamic> map) {
    return RefreshmentDataResponse(
      data: List<RefreshmentItemPurchaseModel>.from(
          map['data']?.map((x) => RefreshmentItemPurchaseModel.fromMap(x))),
      last_page: map['last_page']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshmentDataResponse.fromJson(String source) =>
      RefreshmentDataResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'RefreshmentDataResponse(data: $data, last_page: $last_page)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RefreshmentDataResponse &&
        listEquals(other.data, data) &&
        other.last_page == last_page;
  }

  @override
  int get hashCode => data.hashCode ^ last_page.hashCode;
}
