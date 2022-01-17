import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable ,avoid_dynamic_calls
class BedChangeModel {
  int id;
  String booking_id;
  String before_bed;
  String current_bed;
  String change_date;
  String request_date;
  String status;
  BedChangeModel({
    required this.id,
    required this.booking_id,
    required this.before_bed,
    required this.current_bed,
    required this.change_date,
    required this.request_date,
    required this.status,
  });

  BedChangeModel copyWith({
    int? id,
    String? booking_id,
    String? before_bed,
    String? current_bed,
    String? change_date,
    String? request_date,
    String? status,
  }) {
    return BedChangeModel(
      id: id ?? this.id,
      booking_id: booking_id ?? this.booking_id,
      before_bed: before_bed ?? this.before_bed,
      current_bed: current_bed ?? this.current_bed,
      change_date: change_date ?? this.change_date,
      request_date: request_date ?? this.request_date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'booking_id': booking_id,
      'before_bed': before_bed,
      'current_bed': current_bed,
      'change_date': change_date,
      'request_date': request_date,
      'status': status,
    };
  }

  factory BedChangeModel.fromMap(Map<String, dynamic> map) {
    return BedChangeModel(
      id: map['id']?.toInt() ?? 0,
      booking_id: map['booking_id'] ?? '',
      before_bed: map['before_bed'] ?? '',
      current_bed: map['current_bed'] ?? '',
      change_date: map['change_date'] ?? '',
      request_date: map['request_date'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BedChangeModel.fromJson(String source) =>
      BedChangeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BedChangeModel(id: $id, booking_id: $booking_id, before_bed: $before_bed, current_bed: $current_bed, change_date: $change_date, request_date: $request_date, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BedChangeModel &&
        other.id == id &&
        other.booking_id == booking_id &&
        other.before_bed == before_bed &&
        other.current_bed == current_bed &&
        other.change_date == change_date &&
        other.request_date == request_date &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        booking_id.hashCode ^
        before_bed.hashCode ^
        current_bed.hashCode ^
        change_date.hashCode ^
        request_date.hashCode ^
        status.hashCode;
  }
}
