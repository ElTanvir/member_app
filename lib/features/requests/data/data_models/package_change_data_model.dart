import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable ,avoid_dynamic_calls
class PackageChangeDataModel {
  int id;
  String booking_id;
  String old_category;
  String new_category;
  String old_package;
  String new_package;
  String changed_date;
  String request_date;
  int status;
  PackageChangeDataModel({
    required this.id,
    required this.booking_id,
    required this.old_category,
    required this.new_category,
    required this.old_package,
    required this.new_package,
    required this.changed_date,
    required this.request_date,
    required this.status,
  });

  PackageChangeDataModel copyWith({
    int? id,
    String? booking_id,
    String? old_category,
    String? new_category,
    String? old_package,
    String? new_package,
    String? changed_date,
    String? request_date,
    int? status,
  }) {
    return PackageChangeDataModel(
      id: id ?? this.id,
      booking_id: booking_id ?? this.booking_id,
      old_category: old_category ?? this.old_category,
      new_category: new_category ?? this.new_category,
      old_package: old_package ?? this.old_package,
      new_package: new_package ?? this.new_package,
      changed_date: changed_date ?? this.changed_date,
      request_date: request_date ?? this.request_date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'booking_id': booking_id,
      'old_category': old_category,
      'new_category': new_category,
      'old_package': old_package,
      'new_package': new_package,
      'changed_date': changed_date,
      'request_date': request_date,
      'status': status,
    };
  }

  factory PackageChangeDataModel.fromMap(Map<String, dynamic> map) {
    return PackageChangeDataModel(
      id: map['id']?.toInt() ?? 0,
      booking_id: map['booking_id'] ?? '',
      old_category: map['old_category'] ?? '',
      new_category: map['new_category'] ?? '',
      old_package: map['old_package'] ?? '',
      new_package: map['new_package'] ?? '',
      changed_date: map['changed_date'] ?? '',
      request_date: map['request_date'] ?? '',
      status: map['status']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageChangeDataModel.fromJson(String source) =>
      PackageChangeDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PackageChangeDataModel(id: $id, booking_id: $booking_id, old_category: $old_category, new_category: $new_category, old_package: $old_package, new_package: $new_package, changed_date: $changed_date, request_date: $request_date, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PackageChangeDataModel &&
        other.id == id &&
        other.booking_id == booking_id &&
        other.old_category == old_category &&
        other.new_category == new_category &&
        other.old_package == old_package &&
        other.new_package == new_package &&
        other.changed_date == changed_date &&
        other.request_date == request_date &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        booking_id.hashCode ^
        old_category.hashCode ^
        new_category.hashCode ^
        old_package.hashCode ^
        new_package.hashCode ^
        changed_date.hashCode ^
        request_date.hashCode ^
        status.hashCode;
  }
}
