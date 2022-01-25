// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/requests/data/data_models/package_change_data_model.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class BookingPackageChageResponseModel {
  int id;
  int booking_id;
  String? package_category_name;
  String? package_name;
  List<PackageChangeDataModel> package_change_infos;
  BookingPackageChageResponseModel({
    required this.id,
    required this.booking_id,
    this.package_category_name,
    this.package_name,
    required this.package_change_infos,
  });

  BookingPackageChageResponseModel copyWith({
    int? id,
    int? booking_id,
    String? package_category_name,
    String? package_name,
    List<PackageChangeDataModel>? package_change_infos,
  }) {
    return BookingPackageChageResponseModel(
      id: id ?? this.id,
      booking_id: booking_id ?? this.booking_id,
      package_category_name:
          package_category_name ?? this.package_category_name,
      package_name: package_name ?? this.package_name,
      package_change_infos: package_change_infos ?? this.package_change_infos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'booking_id': booking_id,
      'package_category_name': package_category_name,
      'package_name': package_name,
      'package_change_infos':
          package_change_infos.map((x) => x.toMap()).toList(),
    };
  }

  factory BookingPackageChageResponseModel.fromMap(Map<String, dynamic> map) {
    return BookingPackageChageResponseModel(
      id: map['id']?.toInt() ?? 0,
      booking_id: map['booking_id']?.toInt() ?? 0,
      package_category_name: map['package_category_name'],
      package_name: map['package_name'],
      package_change_infos: List<PackageChangeDataModel>.from(
          map['package_change_infos']
              ?.map((x) => PackageChangeDataModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingPackageChageResponseModel.fromJson(String source) =>
      BookingPackageChageResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookingPackageChageResponseModel(id: $id, booking_id: $booking_id, package_category_name: $package_category_name, package_name: $package_name, package_change_infos: $package_change_infos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingPackageChageResponseModel &&
        other.id == id &&
        other.booking_id == booking_id &&
        other.package_category_name == package_category_name &&
        other.package_name == package_name &&
        listEquals(other.package_change_infos, package_change_infos);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        booking_id.hashCode ^
        package_category_name.hashCode ^
        package_name.hashCode ^
        package_change_infos.hashCode;
  }
}
