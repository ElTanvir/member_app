import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/transactions/data/data_models/rent_info.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable,avoid_dynamic_calls

class RentResponse {
  List<RentInfo> data;
  int last_page;
  RentResponse({
    required this.data,
    required this.last_page,
  });

  RentResponse copyWith({
    List<RentInfo>? data,
    int? last_page,
  }) {
    return RentResponse(
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

  factory RentResponse.fromMap(Map<String, dynamic> map) {
    return RentResponse(
      data: List<RentInfo>.from(map['data']?.map((x) => RentInfo.fromMap(x))),
      last_page: map['last_page']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RentResponse.fromJson(String source) =>
      RentResponse.fromMap(json.decode(source));

  @override
  String toString() => 'RentResponse(data: $data, last_page: $last_page)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RentResponse &&
        listEquals(other.data, data) &&
        other.last_page == last_page;
  }

  @override
  int get hashCode => data.hashCode ^ last_page.hashCode;
}
