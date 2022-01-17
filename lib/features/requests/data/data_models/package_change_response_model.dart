// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/requests/data/data_models/package_change_data_model.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class PackageChageResponseModel {
  int current_page;
  List<PackageChangeDataModel> data;
  int last_page;
  PackageChageResponseModel({
    required this.current_page,
    required this.data,
    required this.last_page,
  });

  PackageChageResponseModel copyWith({
    int? current_page,
    List<PackageChangeDataModel>? data,
    int? last_page,
  }) {
    return PackageChageResponseModel(
      current_page: current_page ?? this.current_page,
      data: data ?? this.data,
      last_page: last_page ?? this.last_page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': current_page,
      'data': data.map((x) => x.toMap()).toList(),
      'last_page': last_page,
    };
  }

  factory PackageChageResponseModel.fromMap(Map<String, dynamic> map) {
    return PackageChageResponseModel(
      current_page: map['current_page']?.toInt() ?? 0,
      data: List<PackageChangeDataModel>.from(
        map['data']?.map((x) => PackageChangeDataModel.fromMap(x)),
      ),
      last_page: map['last_page']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageChageResponseModel.fromJson(String source) =>
      PackageChageResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PackageChageResponseModel(current_page: $current_page, data: $data, last_page: $last_page)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PackageChageResponseModel &&
        other.current_page == current_page &&
        listEquals(other.data, data) &&
        other.last_page == last_page;
  }

  @override
  int get hashCode =>
      current_page.hashCode ^ data.hashCode ^ last_page.hashCode;
}
