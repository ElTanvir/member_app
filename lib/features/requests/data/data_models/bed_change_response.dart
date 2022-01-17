import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/requests/data/data_models/bed_chnage_model.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable ,avoid_dynamic_calls

class BedChangeResponse {
  int last_page;
  List<BedChangeModel> data;
  BedChangeResponse({
    required this.last_page,
    required this.data,
  });

  BedChangeResponse copyWith({
    int? last_page,
    List<BedChangeModel>? data,
  }) {
    return BedChangeResponse(
      last_page: last_page ?? this.last_page,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'last_page': last_page,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory BedChangeResponse.fromMap(Map<String, dynamic> map) {
    return BedChangeResponse(
      last_page: map['last_page']?.toInt() ?? 0,
      data: List<BedChangeModel>.from(
          map['data']?.map((x) => BedChangeModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BedChangeResponse.fromJson(String source) =>
      BedChangeResponse.fromMap(json.decode(source));

  @override
  String toString() => 'BedChangeResponse(last_page: $last_page, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BedChangeResponse &&
        other.last_page == last_page &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => last_page.hashCode ^ data.hashCode;
}
